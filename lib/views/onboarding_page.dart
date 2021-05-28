import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboardingdemo/controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller
                    .onboardingPages.length, //items residing in the controller
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          _controller.onboardingPages[index].imageAsset),
                      SizedBox(height: 32),
                      Text(
                        _controller.onboardingPages[index].title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ));
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onboardingPages.length,
                    (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color:
                                  _controller.selectedPageIndex.value == index
                                      ? Colors.red
                                      : Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          );
                        })),
              ),
            ),

            Positioned(
              right: 20,
              bottom: 120,
              child: Visibility(
                visible: true,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: _controller.buttonEventAction,
                  child: const Icon(Icons.navigate_next),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 120,
              child: Visibility(
                visible: true,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: _controller.backButtonAction,
                  child: const Icon(Icons.navigate_before),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            // Positioned(
            //   left: 20,
            //   bottom: 100,
            //   child: FloatingActionButton(
            //     elevation: 0,
            //     onPressed: _controller.buttonEventAction,
            //     child: Obx(() {
            //       return Text(!_controller.isFirstPage ? 'Back' : 'Back');
            //     }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
