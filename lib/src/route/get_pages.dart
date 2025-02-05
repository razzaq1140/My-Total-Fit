import 'package:my_total_fit/src/feature/ai_chat/pages/ai_chat_page.dart';
import 'package:my_total_fit/src/feature/ai_chat/pages/ai_repsond_page.dart';
import 'package:my_total_fit/src/feature/auth/pages/get_started_page.dart';
import 'package:my_total_fit/src/feature/auth/pages/sign_in_page.dart';
import 'package:my_total_fit/src/feature/auth/pages/verification_code_page.dart';
import 'package:my_total_fit/src/feature/home/pages/all_exercies/pages/all_exercises_screen.dart';
import 'package:my_total_fit/src/feature/home/pages/catogery/pages/catogery_screen.dart';
import 'package:my_total_fit/src/feature/home/pages/exercise_details.dart/model/exercise_model.dart';
import 'package:my_total_fit/src/feature/home/pages/exercise_details.dart/pages/excecise_details.dart';
import 'package:my_total_fit/src/feature/home/pages/home_page.dart';
import 'package:my_total_fit/src/feature/auth/pages/sign_up_page.dart';
import 'package:my_total_fit/src/feature/bottom_navigation_bar/bottom_nav.dart';
import 'package:my_total_fit/src/feature/home/pages/new_work_out/pages/newworkout_screen.dart';
import 'package:my_total_fit/src/feature/home/pages/papuler_traning/pages/populer_traning.dart';
import 'package:my_total_fit/src/feature/home/pages/start_exercise/pages/start_exercise_screen.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/add_workout_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/all_challenges_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/award_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/challenge_workout_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/create_workout_progress_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/day_streak_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/edit_workout_list_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/ready_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/work_out_tracking.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/workout_completed_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/workout_created_by_me_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/workout_creator_page.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/pages/workout_list_page.dart';
import 'package:my_total_fit/src/feature/nutrition/model/meal_model.dart';
import 'package:my_total_fit/src/feature/nutrition/pages/add_meal_page.dart';
import 'package:my_total_fit/src/feature/nutrition/pages/add_new_plan_page.dart';
import 'package:my_total_fit/src/feature/nutrition/pages/all_meals_page.dart';
import 'package:my_total_fit/src/feature/nutrition/pages/meal_details_page.dart';
import 'package:my_total_fit/src/feature/onboarding/model/workout_model.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/bmi_details_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/body_data_animated_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/changed_body_shape_paga.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/clap_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/current_body_shape_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/current_height_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/current_weight_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/desired_body_shape_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/injury_option_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/target_weight_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/02-body_data/weight_graph_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/about_you_animated_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/age_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/days_graph_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/exercise_days_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/exercise_type_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/features_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/fitness_level_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/health_injury_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/get_plan_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/personalized_exercises_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/personalized_feature_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/preference_exercise_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/training_nutrition_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/training_time_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/03-about_you/training_type_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/01-goals/goal_details_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/01-goals/goals_animated_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/01-goals/goals_selection_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/01-goals/muscle_focus_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/gender_selection_page.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/awarding_plan_screen.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/create_plane_screen.dart';
import 'package:my_total_fit/src/feature/onboarding/pages/muscle_gain_screen.dart';
import 'package:my_total_fit/src/feature/profile/pages/genral_setting.dart';
import 'package:my_total_fit/src/feature/profile/pages/setting_screen.dart';
import 'package:my_total_fit/src/feature/profile/pages/workout_settings.dart';
import 'package:my_total_fit/src/feature/subscription_plan/pages/elite_plan_page.dart';
import 'package:my_total_fit/src/feature/subscription_plan/pages/subsceiption_plan_screen.dart';
import 'package:my_total_fit/src/feature/profile/pages/achievement_page.dart';
import 'package:my_total_fit/src/feature/profile/pages/app_usage_page.dart';
import 'package:my_total_fit/src/feature/profile/pages/create_goal_page.dart';
import 'package:my_total_fit/src/feature/profile/pages/fitness_progress.dart';
import 'package:my_total_fit/src/feature/profile/pages/goals_page.dart';
import 'package:my_total_fit/src/feature/profile/pages/profile_page.dart';
import 'package:my_total_fit/src/feature/profile/pages/setting_page.dart';
import 'package:my_total_fit/src/feature/ranking/pages/next_exercise/pages/next_exercise_screen.dart';
import 'package:my_total_fit/src/feature/ranking/pages/nice_work/pages/nice_work_screen.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_dashboard/pages/ranking_dashboard_screen.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/pages/ranking_position_screen.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_screens/pages/ranking_screen.dart';
import 'package:my_total_fit/src/feature/welcome/demo.dart';
import 'package:my_total_fit/src/feature/welcome/splash_page.dart';
import 'package:my_total_fit/src/feature/welcome/welcome_page_two.dart';
import 'package:my_total_fit/src/feature/welcome/welcome_page_one.dart';
import 'package:my_total_fit/src/feature/profile/model/profile_model.dart';
import 'package:my_total_fit/src/route/route_transition.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../feature/auth/pages/create_password_page.dart';
import '../feature/auth/pages/forget_password_page.dart';
import '../feature/auth/pages/otp_verification_page.dart';
import 'error_route.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.splash}',
    routes: [
      GoRoute(
        name: AppRoute.signInPage,
        path: '/${AppRoute.signInPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.forgetPasswordPage,
        path: '/${AppRoute.forgetPasswordPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ForgetPasswordPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.signUpPage,
        path: '/${AppRoute.signUpPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.otpVerificationPage,
        path: '/${AppRoute.otpVerificationPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const OtpVerificationPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.createPasswordPage,
        path: '/${AppRoute.createPasswordPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CreatePasswordPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.bottomNav,
        path: '/${AppRoute.bottomNav}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BottomNav(),
        ),
      ),
      GoRoute(
        name: AppRoute.splash,
        path: '/${AppRoute.splash}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.welcomeOne,
        path: '/${AppRoute.welcomeOne}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WelcomePageOne(),
        ),
      ),
      GoRoute(
        name: AppRoute.welcomeTwo,
        path: '/${AppRoute.welcomeTwo}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WelcomePageTwo(),
        ),
      ),

      GoRoute(
        name: AppRoute.homePage,
        path: '/${AppRoute.homePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.catogeryScreen,
        path: '/${AppRoute.catogeryScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CatogeryScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.traning,
        path: '/${AppRoute.traning}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PopularTrining(),
        ),
      ),
      GoRoute(
        name: AppRoute.workout,
        path: '/${AppRoute.workout}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewworkoutScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.aiChat,
        path: '/${AppRoute.aiChat}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AiChatPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.aiRespond,
        path: '/${AppRoute.aiRespond}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AiRepsondPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.allMeals,
        path: '/${AppRoute.allMeals}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AllMealsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.addPlan,
        path: '/${AppRoute.addPlan}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddNewPlanPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.addMeal,
        path: '/${AppRoute.addMeal}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddMealPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.mealDetails,
        path: '/${AppRoute.mealDetails}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: MealDetailsPage(
            meal: state.extra as MealModel,
          ),
        ),
      ),
      GoRoute(
        name: AppRoute.profilePage,
        path: '/${AppRoute.profilePage}',
        pageBuilder: (context, state) {
          // Check if `state.extra` is not null and cast it to `User`, otherwise use a default user from `dummyUsers`
          // final User user = (state.extra as User?) ?? dummyUsers[0];

          return buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: const ProfilePage(),
          );
        },
      ),
      GoRoute(
        name: AppRoute.achievementPage,
        path: '/${AppRoute.achievementPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AchievementPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.fitnessProgressPage,
        path: '/${AppRoute.fitnessProgressPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const FitnessProgressPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.appUsagePage,
        path: '/${AppRoute.appUsagePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AppUsagePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.goalsPage,
        path: '/${AppRoute.goalsPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GoalsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.settingPage,
        path: '/${AppRoute.settingPage}',
        pageBuilder: (context, state) {
          // Check if `state.extra` is not null and cast it to `User`, otherwise use a default user from `dummyUsers`
          final User user = (state.extra as User?) ?? dummyUser;

          return buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: SettingPage(user: user),
          );
        },
      ),
      GoRoute(
          name: AppRoute.excerciseDetails,
          path: '/${AppRoute.excerciseDetails}',
          pageBuilder: (context, state) {
            final ExerciseModel exercise = state.extra as ExerciseModel;
            return buildPageWithFadeTransition<void>(
              context: context,
              state: state,
              child: ExerciseDetailScreen(
                exercise: exercise,
              ),
            );
          }),
      GoRoute(
        name: AppRoute.startExercise,
        path: '/${AppRoute.startExercise}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const StartExerciseScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.workouttracking,
        path: '/${AppRoute.workouttracking}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WorkOutTrackingScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.allExercises,
        path: '/${AppRoute.allExercises}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AllExercisesScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.rankingscreen,
        path: '/${AppRoute.rankingscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const RankingScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.rankingDashboard,
        path: '/${AppRoute.rankingDashboard}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const RankingDashboardScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.nicework,
        path: '/${AppRoute.nicework}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NiceWorkScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.createGoalPage,
        path: '/${AppRoute.createGoalPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CreateGoalPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.verificationCodePage,
        path: '/${AppRoute.verificationCodePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const VerificationCodePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.getStartedPage,
        path: '/${AppRoute.getStartedPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GetStartedPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.allChallenges,
        path: '/${AppRoute.allChallenges}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AllChallengesPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.nextexercise,
        path: '/${AppRoute.nextexercise}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NextExerciseScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.rankingposition,
        path: '/${AppRoute.rankingposition}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const RankingPositionScreen(),
        ),
      ),

      //! On boarding
      GoRoute(
        name: AppRoute.genderSelection,
        path: '/${AppRoute.genderSelection}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GenderSelectionPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.goalsAnimation,
        path: '/${AppRoute.goalsAnimation}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GoalsAnimatedPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.goalsSelection,
        path: '/${AppRoute.goalsSelection}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GoalsSelectionPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.goalsDetails,
        path: '/${AppRoute.goalsDetails}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GoalDetailsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.muscle,
        path: '/${AppRoute.muscle}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MuscleFocusPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.subscriptions,
        path: '/${AppRoute.subscriptions}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: SubscriptionScreen(isUpgrade: state.extra as bool),
        ),
      ),
      GoRoute(
        name: AppRoute.plans,
        path: '/${AppRoute.plans}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CreatePlanScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.muscleg,
        path: '/${AppRoute.muscleg}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MuscleGainScreen(),
        ),
      ),
      GoRoute(
          name: AppRoute.awardingplan1,
          path: '/${AppRoute.awardingplan1}',
          pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
                context: context,
                state: state,
                child: const AwardingPlanScreen(),
              )),

      //! Body Data Section
      GoRoute(
        name: AppRoute.bodyDataAnimation,
        path: '/${AppRoute.bodyDataAnimation}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BodyDataAnimatedPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.currentWeight,
        path: '/${AppRoute.currentWeight}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WeightPickerScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.targetWeight,
        path: '/${AppRoute.targetWeight}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const TargetWeightPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.currentHeight,
        path: '/${AppRoute.currentHeight}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CurrentHeightPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.currentBodyShape,
        path: '/${AppRoute.currentBodyShape}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CurrentBodyShapePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.desiredBodyShape,
        path: '/${AppRoute.desiredBodyShape}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DesiredBodyShapePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.changedBodyShape,
        path: '/${AppRoute.changedBodyShape}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ChangedBodyShapePaga(),
        ),
      ),
      GoRoute(
        name: AppRoute.weightGraph,
        path: '/${AppRoute.weightGraph}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WeightGraphPage(),
        ),
      ),

      //! About You Section
      GoRoute(
        name: AppRoute.aboutYouAnimation,
        path: '/${AppRoute.aboutYouAnimation}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AboutYouAnimatedPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.age,
        path: '/${AppRoute.age}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AgePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.daysGraph,
        path: '/${AppRoute.daysGraph}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DaysGraphPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.fitnessLevel,
        path: '/${AppRoute.fitnessLevel}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const FitnessLevelScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.preferenceExercise,
        path: '/${AppRoute.preferenceExercise}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PreferenceExercisePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.exerciseDays,
        path: '/${AppRoute.exerciseDays}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ExerciseDaysPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.trainingTime,
        path: '/${AppRoute.trainingTime}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const TrainingTimePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.trainingType,
        path: '/${AppRoute.trainingType}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const TrainingTypePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.healthInjury,
        path: '/${AppRoute.healthInjury}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HealthInjuryPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.exerciseType,
        path: '/${AppRoute.exerciseType}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ExerciseTypePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.trainingNutrition,
        path: '/${AppRoute.trainingNutrition}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const TrainingNutritionPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.personalizedFeature,
        path: '/${AppRoute.personalizedFeature}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PersonalizedFeaturePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.personalizedExercise,
        path: '/${AppRoute.personalizedExercise}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PersonalizedExercisesPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.features,
        path: '/${AppRoute.features}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const FeaturesPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.bmiDetails,
        path: '/${AppRoute.bmiDetails}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BmiDetailsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.injuryOptions,
        path: '/${AppRoute.injuryOptions}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const InjuryOptionPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.clap,
        path: '/${AppRoute.clap}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ClapPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.getPlan,
        path: '/${AppRoute.getPlan}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GetPlanPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.elitePlan,
        path: '/${AppRoute.elitePlan}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ElitePlanPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.settingscree,
        path: '/${AppRoute.settingscree}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SettingsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.workoutCreator,
        path: '/${AppRoute.workoutCreator}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WorkoutCreatorPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.createWorkoutProgress,
        path: '/${AppRoute.createWorkoutProgress}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CreateWorkoutProgressPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.workoutList,
        path: '/${AppRoute.workoutList}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WorkoutListPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.dayStreak,
        path: '/${AppRoute.dayStreak}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DayStreakPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.challengeWorkout,
        path: '/${AppRoute.challengeWorkout}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ChallengeWorkoutPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.ready,
        path: '/${AppRoute.ready}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ReadyPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.workoutCompleted,
        path: '/${AppRoute.workoutCompleted}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WorkoutCompletedPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.award,
        path: '/${AppRoute.award}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AwardPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.editWorkoutList,
        path: '/${AppRoute.editWorkoutList}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: EditWorkoutListPage(workout: state.extra as WorkoutModel),
        ),
      ),
      GoRoute(
        name: AppRoute.addWorkout,
        path: '/${AppRoute.addWorkout}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddWorkoutPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.workoutCreatedByMe,
        path: '/${AppRoute.workoutCreatedByMe}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WorkoutCreatedByMePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.demo,
        path: '/${AppRoute.demo}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LineChartSample(),
        ),
      ),
      GoRoute(
        name: AppRoute.workoutsetting,
        path: '/${AppRoute.workoutsetting}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WorkoutSettings(),
        ),
      ),
      GoRoute(
        name: AppRoute.genralsetting,
        path: '/${AppRoute.genralsetting}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GeneralSettings(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String demo = 'demo';

  static const String errorPage = 'error-page';
  static const String bottomNav = 'bottom-nav';
  static const String signInPage = 'sign-in-page';

//! home Pages Flow
  static const String homePage = 'home';
  static const String catogeryScreen = 'catogery';
  static const String traning = 'papuler-traning';
  static const String workout = 'new-work-out';
  static const String excerciseDetails = 'exercise-details';
  static const String startExercise = 'start-exercise';
  static const String workouttracking = 'work-out-tracking';
  static const String allExercises = 'all-exercies';

  //! ranking Flow
  static const String rankingscreen = 'ranking-screens';
  static const String rankingDashboard = 'ranking-dashboard';
  static const String nicework = 'nice-work';
  static const String nextexercise = 'next_exercise';
  static const String rankingposition = 'ranking-position';
  static const String positionlist = 'ranking-position-list';

  static const String aiChat = 'ai-chat';
  static const String aiRespond = 'ai-respond';

  static const String signUpPage = 'sign-up-page';
  static const String otpVerificationPage = 'otp-verification-page';
  static const String createPasswordPage = 'create-password-page';
  static const String forgetPasswordPage = 'forget-password-page';

  //! Welcome Pages
  static const String welcomePage = 'welcome-page';
  static const String welcomePageTwo = 'welcome-page-two';
  static const String welcomePageThree = 'welcome-page-three';
  //!   OnBoarding Screens
//! Welcome Pages
  static const String splash = 'splash';
  static const String welcomeOne = 'welcome-one';
  static const String welcomeTwo = 'welcome-two';

  static const String genderSelection = 'gender-selection';

  // 1 - Goals Section
  static const String goalsAnimation = 'goals-animation';
  static const String goalsSelection = 'goals-selection';
  static const String goalsDetails = 'goals-details';
  static const String muscle = 'muscle-focus';
  static const String subscriptions = 'subscription-plan';
  static const String plans = 'create-plane';
  static const String muscleg = 'muscle-gain';
  static const String awardingplan1 = 'awarding-plan';
  static const String muscleFocus = 'muscle-focus';

  // 2 - Body-Data Section
  static const String bodyDataAnimation = 'body-data-animation';
  static const String currentWeight = 'current-weight';
  static const String targetWeight = 'target-weight';
  static const String currentHeight = 'current-height';
  static const String currentBodyShape = 'current-body-shape';
  static const String desiredBodyShape = 'desired-body-shape';

  static const String changedBodyShape = 'changed-body-shape';
  static const String weightGraph = 'weight-graph';
  static const String bmiDetails = 'bmi-details';
  static const String injuryOptions = 'injury-options';
  static const String clap = 'clap';

  // 3 - About-You Section
  static const String aboutYouAnimation = 'about-you-animation';
  static const String age = 'age';
  static const String daysGraph = 'days-graph';
  static const String fitnessLevel = 'fitness-level';
  static const String preferenceExercise = 'preference-exercise';
  static const String exerciseDays = 'exercise-days';
  static const String trainingTime = 'training-time';
  static const String trainingType = 'training-type';
  static const String healthInjury = 'health-injury';
  static const String exerciseType = 'exercise-type';
  static const String trainingNutrition = 'training-nutrition';
  static const String personalizedFeature = 'personalized-feature';
  static const String personalizedExercise = 'personalized-exercise';
  static const String features = 'features';
  static const String getPlan = 'get-plan';
  // Mishal nrough Login

  //! Nutrition Flow
  static const String allMeals = 'all-meals';
  static const String addPlan = 'add-plan';
  static const String addMeal = 'add-meal';
  static const String mealDetails = 'meal-details';
  // profile

  static const String profilePage = 'Profile-page';
  static const String achievementPage = 'achievement-page';
  static const String appUsagePage = 'app-usage-page';
  static const String fitnessProgressPage = 'fitness-progress-page';
  static const String goalsPage = 'goals-page';
  static const String settingPage = 'setting-page';

  static const String createGoalPage = 'create-goal-page';
  static const String settingscree = 'setting-screen';

  // auth
  static const String verificationCodePage = 'verification-code-page';
  static const String getStartedPage = 'get-started-page';

  static const String allChallenges = 'all-challenges';
  static const String elitePlan = 'elite-plan';

  static const String workoutsetting = 'workout_setting';
  static const String genralsetting = 'genral_setting';
  static const String nutritionPage = 'nutrition-page';

  static const String workoutCreator = 'workout-creator';
  static const String createWorkoutProgress = 'create-workout-progress';
  static const String workoutList = 'workout-list';
  static const String editWorkoutList = 'edit-workout-list';

  static const String dayStreak = 'day-streak';
  static const String challengeWorkout = 'challenge-workout';

  static const String ready = 'ready';
  static const String workoutCompleted = 'workout-completd';
  static const String award = 'award';

  static const String addWorkout = 'add-workout';
  static const String workoutCreatedByMe = 'workout-created-by-me';
}
