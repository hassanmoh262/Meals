import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/core/services/service_locator.dart';
import 'package:meals/presentation/components/external_meal_widget.dart';
import 'package:meals/presentation/controller/meals_cubit/meals_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MealsCubit>()..getMeals(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals Reciepes", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 32, 54, 90),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  return TextField(
                    onChanged: (value) {
                      context.read<MealsCubit>().serchMeals(value);
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Shawrma',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<MealsCubit, MealsState>(
              builder: (context, state) {
                if (state is MealsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is MealsLoadedState) {
                  if (state.meals.isEmpty) {
                    return Expanded(
                      child: Center(child: Text("No meal in this name")),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.meals.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExternalMealwidget(state.meals[index]);
                      },
                    ),
                  );
                } else if (state is MealsErrorState) {
                  return Center(child: Text(state.errorMessage));
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
