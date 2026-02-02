import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_2026/core/shared_widgets/button.dart';
import 'package:todo_2026/features/onboarding/onbarding_providers.dart';
import 'package:todo_2026/features/onboarding/presentation/models/onboarding_ui_model.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  static const Color blueColor = Color.fromARGB(255, 2, 84, 151);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: onboardingSlides
                .map(
                  (slide) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: Center(
                      child: Column(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(slide.icon, size: 100),
                          Text(
                            slide.title,
                            // style: titleStyle
                          ),
                          Divider(),
                          Text(
                            slide.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.5,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.11,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _currentPage > 0,
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    child: IconButton(
                      onPressed: () {
                        if (_currentPage > 0) {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      icon: Icon(Icons.arrow_back, size: 33),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: _currentPage == index ? 12 : 10,
                        height: _currentPage == index ? 12 : 10,
                        decoration: BoxDecoration(
                          color:
                              (_currentPage == index || _currentPage >= index)
                              ? blueColor
                              : Colors.grey,
                          border: Border.all(
                            color: _currentPage != index
                                ? blueColor
                                : Colors.transparent,
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _currentPage >= 0 && _currentPage < 2,
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    child: IconButton(
                      onPressed: () {
                        if (_currentPage < 2) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      icon: Icon(Icons.arrow_forward, size: 33),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.025,
            left: 18,
            right: 18,
            child: buttonValidate(
              title: "Commencer",
              onPressed: () async {
                // Action pour passer l'onboarding
                await ref.read(onboardingProvider.notifier).completed();
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
