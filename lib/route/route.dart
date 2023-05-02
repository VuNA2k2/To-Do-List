import 'package:auto_route/annotations.dart';
import 'package:todo_list/views/all_notes/all_notes_screen.dart';
import 'package:todo_list/views/all_project/all_project_screen.dart';
import 'package:todo_list/views/calendar/calendar_screen.dart';
import 'package:todo_list/views/dashboard/dashboard_screen.dart';
import 'package:todo_list/views/do_task/do_task_screen.dart';
import 'package:todo_list/views/fill_profile/fill_profile_screen.dart';
import 'package:todo_list/views/home/home_screen.dart';
import 'package:todo_list/views/login/login_screen.dart';
import 'package:todo_list/views/note/create_note/create_note_screen.dart';
import 'package:todo_list/views/note/note_detail/note_detail_screen.dart';
import 'package:todo_list/views/profile/profile_screen.dart';
import 'package:todo_list/views/project/create_project/create_project_screen.dart';
import 'package:todo_list/views/project/project_detail/project_detail_screen.dart';
import 'package:todo_list/views/sign_up/sign_up_screen.dart';
import 'package:todo_list/views/splash_screen/splash_screen.dart';
import 'package:todo_list/views/task/create_task/create_task_screen.dart';
import 'package:todo_list/views/task/task_detail/task_detail_screen.dart';
import 'package:todo_list/views/today_task/today_task_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: SplashScreen,
      initial: true,
    ),
    MaterialRoute(
      page: HomeScreen,
      children: [
        MaterialRoute(
          page: DashboardScreen,
          initial: true,
        ),
        MaterialRoute(
          page: AllProjectScreen,
        ),
        MaterialRoute(
          page: CalendarScreen,
        ),
        MaterialRoute(
          page: ProfileScreen,
        ),
      ],
    ),
    MaterialRoute(
      page: LoginScreen,
    ),
    MaterialRoute(
      page: SignUpScreen,
    ),
    MaterialRoute(
      page: FillProfileScreen,
    ),
    MaterialRoute(
      page: TodayTaskScreen,
    ),
    MaterialRoute(
      page: AllNotesScreen,
    ),
    MaterialRoute(
      page: DoTaskScreen,
    ),
    MaterialRoute(
      page: ProjectDetailScreen,
    ),
    MaterialRoute(
      page: TaskDetailScreen,
    ),
    MaterialRoute(
      page: NoteDetailScreen,
    ),
    MaterialRoute(
      page: CreateNoteScreen,
    ),
    MaterialRoute(
      page: CreateTaskScreen,
    ),
    MaterialRoute(
      page: CreateProjectScreen,
    ),

  ],
)
class $AppRouter {}
