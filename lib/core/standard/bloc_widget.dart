// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// import '../shared/cubits/base_cubit/async_cubit.dart';
//
// abstract class BlocStatelessWidget<C extends BlocBase> extends StatelessWidget {
//   const BlocStatelessWidget({super.key});
//
//   C get create;
//
//   Widget buildContent(BuildContext context, C ref);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<C>(
//       create: (context) => create,
//       child: Builder(
//         builder: (context) {
//           final cubit = BlocProvider.of<C>(context);
//           return buildContent(context, cubit);
//         },
//       ),
//     );
//   }
// }
//
// abstract class BlocHookWidget<C extends BlocBase> extends StatelessWidget {
//   const BlocHookWidget({super.key});
//
//   C get create;
//
//   Widget buildContent(BuildContext context, C ref);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<C>(
//       create: (context) => create,
//       child: Builder(
//         builder: (context) {
//           final cubit = BlocProvider.of<C>(context);
//           return HookBuilder(
//             builder: (context) => buildContent(context, cubit),
//           );
//         },
//       ),
//     );
//   }
// }
//
// abstract class BlocStatefulWidget<C extends BlocBase> extends StatefulWidget {
//   const BlocStatefulWidget({super.key});
//
//   C get create;
//
//   void initState() {}
//
//   void dispose() {}
//
//   Widget buildContent(BuildContext context, C ref, State state);
//
//   @override
//   State<BlocStatefulWidget<C>> createState() => _BlocStatefulWidgetState<C>();
// }
//
// class _BlocStatefulWidgetState<C extends BlocBase>
//     extends State<BlocStatefulWidget<C>> {
//   @override
//   void initState() {
//     widget.initState();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     widget.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<C>(
//       create: (context) => widget.create,
//       child: Builder(
//         builder: (context) {
//           final cubit = BlocProvider.of<C>(context);
//           return widget.buildContent(context, cubit, this);
//         },
//       ),
//     );
//   }
// }
//
// class AsyncBlocBuilder<D, C extends AsyncCubit<D>> extends StatelessWidget {
//   final Widget Function(BuildContext, AsyncState<D>) builder;
//   const AsyncBlocBuilder({super.key, required this.builder});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<C, AsyncState<D>>(
//       builder: (context, state) {
//         return builder(context, state);
//       },
//     );
//   }
// }
