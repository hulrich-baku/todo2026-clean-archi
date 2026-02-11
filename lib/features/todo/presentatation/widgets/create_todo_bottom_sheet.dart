import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/core/presentation/service/ui_helpers_date.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_2026/features/todo/presentatation/providers/todo_providers.dart';

class CreateTodoBottomSheet extends ConsumerStatefulWidget {
  const CreateTodoBottomSheet({super.key});

  @override
  ConsumerState<CreateTodoBottomSheet> createState() =>
      _CreateTodoBottomSheetState();
}

class _CreateTodoBottomSheetState extends ConsumerState<CreateTodoBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool showDetails = false;
  bool isFavorite = false;
  DateTime? date;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Nouvelle tâche',
                      border: .none,
                      counterText: "",
                    ),
                    maxLength: 200,
                    maxLines: 5,
                    minLines: 1,
                  ),
                  showDetails
                      ? TextField(
                          style: TextStyle(fontSize: 12.8),
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Ajouter des détails',
                            border: .none,
                            counterText: "",
                          ),
                          maxLength: 500,
                          maxLines: 9,
                          minLines: 1,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15, left: 5),
              child: Row(
                mainAxisAlignment: .start,
                spacing: MediaQuery.of(context).size.width * 0.02,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showDetails = true;
                      });
                    },
                    icon: Icon(Icons.notes),
                  ),
                  IconButton(
                    onPressed: () async {
                      date = await showAppDatePicker(context: context);
                    },
                    icon: Icon(Icons.access_time_sharp),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                  ),
                  Expanded(child: SizedBox()),
                  // Ecouteur pour activer ou désactiver le bouton
                  // selon que le champ title est vide ou non
                  ValueListenableBuilder(
                    valueListenable: titleController,
                    builder: (context, value, child) {
                      final bool canSave = titleController.text
                          .trim()
                          .isNotEmpty;
                      return TextButton(
                        onPressed: canSave
                            ? () async {
                                final Todo todo = Todo(
                                  id: null,
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  isFavorite: isFavorite,
                                  isCompleted: false,
                                  createdAt: null,
                                );
                                try {
                                  await ref.read(createTodoProvider)(todo);
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                } catch (e) {
                                  print("Erreur : $e");
                                }
                              }
                            : null,
                        child: Text('Enregistrer'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
