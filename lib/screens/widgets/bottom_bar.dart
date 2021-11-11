import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:task_management/store/model.dart';
import 'package:redux/redux.dart';
import 'package:task_management/store/view_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        onInitialBuild: (viewModel) {},
        builder: (context, viewModel) {
          return BottomAppBar(
            elevation: 0,
            color: Colors.blueAccent,
            child: Container(
              width: double.infinity,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // button all tasks
                  GestureDetector(
                    onTap: () => viewModel.goToPage(1),
                    child: Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Icon(
                          Icons.list,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),

                  // button done tasks
                  GestureDetector(
                    onTap: () => viewModel.goToPage(2),
                    child: Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),

                  // button doing tasks
                  GestureDetector(
                    onTap: () => viewModel.goToPage(3),
                    child: Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
