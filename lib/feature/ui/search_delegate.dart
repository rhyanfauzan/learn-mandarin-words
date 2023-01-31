// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../config/theme.dart';
// import '../bloc/git_bloc.dart';

// class CustomSearchDelegate extends SearchDelegate {
//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       appBarTheme: AppBarTheme(
//         elevation: 0,
//         color: lightBackgroundColor,
//       ),
//     );
//   }

//   @override
//   TextStyle get searchFieldStyle => blackTextStyle.copyWith(
//         color: darkColor,
//       );

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     ApiGitBloc apiGitBloc = context.read<ApiGitBloc>();

//     return [
//       Padding(
//         padding: const EdgeInsets.only(right: 10),
//         child: BlocBuilder<ApiGitBloc, ApiGitState>(
//           bloc: apiGitBloc,
//           builder: (context, state) {
//             return IconButton(
//               icon: Icon(
//                 Icons.search_rounded,
//                 color: darkColor,
//               ),
//               // onPressed: () => query = '',
//               onPressed: () {
//                 apiGitBloc
//                   ..oldKosaKata?.clear()
//                   ..page = 1
//                   ..add(OnRequestApiGit());
//                 close(context, null);
//               },
//             );
//           },
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         Icons.arrow_back_ios,
//         color: darkColor,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Column(
//       children: const [],
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Column(
//       children: const [],
//     );
//   }
// }
