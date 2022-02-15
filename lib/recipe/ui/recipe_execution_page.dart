import 'package:coffea/recipe/recipe.dart';
import 'package:coffea/recipe/step.dart' as coffea;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeExecutionPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeExecutionPage(this.recipe, {Key? key}) : super(key: key);

  @override
  State<RecipeExecutionPage> createState() => _RecipeExecutionPageState();
}

class _RecipeExecutionPageState extends State<RecipeExecutionPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: widget.recipe.steps.length,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    print(widget.recipe.steps);
    return Scaffold(
      appBar: AppBar(title: Text('Recipe ${widget.recipe.name}')),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: widget.recipe.steps
              .map(
                (step) => StepTab(
                  step: step,
                  tabController: _tabController,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class StepTab extends StatelessWidget {
  final coffea.Step step;
  final TabController tabController;

  const StepTab({
    Key? key,
    required this.step,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<coffea.Step, coffea.StepState>(
      bloc: step,
      listener: (_, state) {
        if (state is coffea.Finished) {
          step.stop();
          tabController.index++;
        }
      },
      builder: (_, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(step.description),
            state is coffea.Running
                ? Text('Duration ${state.remainingDuration.inSeconds}')
                : Text('Duration ${step.duration.inSeconds}'),
            ElevatedButton(
              child: const Icon(Icons.play_arrow),
              onPressed: () => step.start(),
            ),
          ],
        );
      },
    );
  }
}
