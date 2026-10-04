import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/core/services/service_locator.dart';
import 'package:meals/presentation/controller/meals_details_cubit/meals_details_cubit.dart';

class ReciepeDetails extends StatelessWidget {
  final String mealName;
  const ReciepeDetails({super.key, required this.mealName});
  List<String> getInstructionSteps(String rawInstructions) {
    return rawInstructions
        .split('. ')
        .where((step) => step.trim().isNotEmpty)
        .map(
          (step) => step.trim().endsWith('.') ? step.trim() : '${step.trim()}.',
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MealsDetailsCubit>()..getMealDetails(mealName),
      child: Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(255, 32, 54, 90)),
        body: SingleChildScrollView(
          child: BlocBuilder<MealsDetailsCubit, MealsDetailsState>(
            builder: (context, state) {
              if (state is MealsDetailsLoadingState) {
                return CircularProgressIndicator();
              } else if (state is MealsDetailsLoadedState) {
                final steps = getInstructionSteps(
                  state.mealDetails.instructions,
                );

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 227, 227),
                      ),
                      margin: EdgeInsets.all(8),
                      height: 200,
                      width: 400,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(120),
                              child: Image.network(state.mealDetails.image),
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              minFontSize: 16,
                              maxLines: 4,
                              state.mealDetails.mealName,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ListView.builder(
                      shrinkWrap: true, // يمنع القائمة من طلب ارتفاع لا نهائي
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.mealDetails.ingredientsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = state.mealDetails.ingredientsList[index];
                        return Center(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 181, 201, 211),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 40,
                            width: 320,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    item["name"] ?? "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(item['measure'] ?? ""),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        'Instructions:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 32, 54, 90),
                        ),
                      ),
                    ),

                    // قائمة التعليمات مرقمة ومترتبة
                    ListView.builder(
                      shrinkWrap:
                          true, // يمنع خروج الـ ListView عن مساحة الشاشة
                      physics:
                          const NeverScrollableScrollPhysics(), // يمنع تعارض السكرول
                      itemCount: steps.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // يضمن محاذاة الرقم مع أول السطر
                            children: [
                              // دائرة الترقيم (1, 2, 3...)
                              Container(
                                width: 28,
                                height: 28,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 32, 54, 90),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // نص الخطوة
                              Expanded(
                                // مهم جداً عشان النص ينزل سطر جديد وميعملش Overflow
                                child: Text(
                                  steps[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.4, // مسافة مريحة بين الأسطر
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              } else if (state is MealsDetailsErrorState) {
                return Center(child: Text(state.errorMessage));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
