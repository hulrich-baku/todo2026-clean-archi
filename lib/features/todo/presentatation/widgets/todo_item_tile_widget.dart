import 'package:flutter/material.dart';
import 'package:todo_2026/features/todo/domain/entities/todo_entity.dart';

class TodoItemTileWidget extends StatelessWidget {
  const TodoItemTileWidget({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card( // On ajoute une Card pour un effet d'élévation
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        // Affichage du titre
        title: Text(
          todo.title,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            // Si la tâche est finie, on barre le texte
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            fontFamily: "Roboto"
          ),
        ),
        
        // Affichage de la description (si elle existe)
        // subtitle: Column(
        //   crossAxisAlignment: .start,
        //   children: [
        //     if (todo.description != null && todo.description!.isNotEmpty)
        //       Text(
        //         todo.description!,
        //         maxLines: 2,
        //         overflow: TextOverflow.ellipsis, // Coupe le texte avec "..."
        //       ),
        //     // Affichage de la date formatée
            
        //   ],
        // ),

        // Case à cocher à gauche
        leading: Checkbox(
          value: todo.isCompleted,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onChanged: (bool? value) {
            // TODO: Appeler ton UseCase pour mettre à jour la tâche
          },
        ),

        // Icône étoile à droite pour les favoris
        trailing: Icon(
          todo.isFavorite ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
  