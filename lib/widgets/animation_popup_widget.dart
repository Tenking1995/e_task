
// * 1st Manually control the animation

// class AnimationPopupWidget extends StatefulWidget {
//   final double startWidth;
//   final double startHeight;
//   final double endWidth;
//   final double endHeight;
//   const AnimationPopupWidget({
//     Key? key,
//     this.startWidth = double.infinity,
//     this.startHeight = 260, // example height
//     this.endWidth = double.infinity,
//     this.endHeight = 320, // example height
//   }) : super(key: key);

//   @override
//   State<AnimationPopupWidget> createState() => _AnimationPopupWidgetState();
// }

// class _AnimationPopupWidgetState extends State<AnimationPopupWidget> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Size> _heightAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _heightAnimation = Tween<Size>(
//       begin: Size(widget.startWidth, widget.startHeight),
//       end: Size(widget.endWidth, widget.endHeight),
//     ).animate(
//       // Curves.linear: move between begin and end in the same speed (default)
//       // Curves.easeIn
//       // Curves.fastOutSlowIn: start slow and end fast
//       CurvedAnimation(parent: _animationController, curve: Curves.linear),
//     );
//     _heightAnimation.addListener(() => setState(() {})); // to redraw the screen
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _animationController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: _heightAnimation.value.height,
//       constraints: BoxConstraints(minHeight: _heightAnimation.value.height),
//       child: Column(children: [
//         ElevatedButton(
//           onPressed: () {
//             _animationController.forward(); // start animation
//           },
//           child: const Text('start'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _animationController.reverse(); // reverse animation
//           },
//           child: const Text('back'),
//         )
//       ]),
//     );
//   }
// }

// * 2nd Animation with built in widget (much effiecient)

// class AnimationPopupWidget extends StatefulWidget {
//   final double startWidth;
//   final double startHeight;
//   final double endWidth;
//   final double endHeight;
//   const AnimationPopupWidget({
//     Key? key,
//     this.startWidth = double.infinity,
//     this.startHeight = 260, // example height
//     this.endWidth = double.infinity,
//     this.endHeight = 320, // example height
//   }) : super(key: key);

//   @override
//   State<AnimationPopupWidget> createState() => _AnimationPopupWidgetState();
// }

// class _AnimationPopupWidgetState extends State<AnimationPopupWidget> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Size> _heightAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _heightAnimation = Tween<Size>(
//       begin: Size(widget.startWidth, widget.startHeight),
//       end: Size(widget.endWidth, widget.endHeight),
//     ).animate(
//       // Curves.linear: move between begin and end in the same speed (default)
//       // Curves.easeIn
//       // Curves.fastOutSlowIn: start slow and end fast
//       CurvedAnimation(parent: _animationController, curve: Curves.linear),
//     );
//     // _heightAnimation.addListener(() => setState(() {})); // to redraw the screen
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _animationController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // * rebuild part if ui only
//     return AnimatedBuilder(
//       animation: _heightAnimation,
//       builder: (context, ch) {
//         return Container(
//           height: _heightAnimation.value.height,
//           constraints: BoxConstraints(minHeight: _heightAnimation.value.height),
//           child: ch,
//         );
//       },
//       // * This part wont be rebuild
//       child: Column(children: [
//         ElevatedButton(
//           onPressed: () {
//             _animationController.forward(); // start animation
//           },
//           child: const Text('start'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _animationController.reverse(); // reverse animation
//           },
//           child: const Text('back'),
//         )
//       ]),
//     );
//   }
// }

// * 3rd Animation without controller

// class AnimationPopupWidget extends StatefulWidget {
//   final double startWidth;
//   final double startHeight;
//   final double endWidth;
//   final double endHeight;
//   const AnimationPopupWidget({
//     Key? key,
//     this.startWidth = double.infinity,
//     this.startHeight = 260, // example height
//     this.endWidth = double.infinity,
//     this.endHeight = 320, // example height
//   }) : super(key: key);

//   @override
//   State<AnimationPopupWidget> createState() => _AnimationPopupWidgetState();
// }

// class _AnimationPopupWidgetState extends State<AnimationPopupWidget> with SingleTickerProviderStateMixin {
//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // * rebuild part if ui only
//     return AnimatedContainer(
//       height: 1 == 1 ? 320 : 260,
//       constraints: const BoxConstraints(minHeight: 1 == 1 ? 320 : 260),
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//       child: Column(children: [
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               // increaseHeight();
//             });
//           },
//           child: const Text('start'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               // decreaseHeight();
//             });
//           },
//           child: const Text('back'),
//         )
//       ]),
//     );
//   }
// }

// * 4rd More Animation (can refer official widget catelog > animation catelog) - FadeTransition, SlideTransition, Opacity

// class AnimationPopupWidget extends StatefulWidget {
//   final double startWidth;
//   final double startHeight;
//   final double endWidth;
//   final double endHeight;
//   const AnimationPopupWidget({
//     Key? key,
//     this.startWidth = double.infinity,
//     this.startHeight = 260, // example height
//     this.endWidth = double.infinity,
//     this.endHeight = 320, // example height
//   }) : super(key: key);

//   @override
//   State<AnimationPopupWidget> createState() => _AnimationPopupWidgetState();
// }

// class _AnimationPopupWidgetState extends State<AnimationPopupWidget> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Size> _heightAnimation;
//   late Animation<double> _opacityAnimation; // opacity animation
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _heightAnimation = Tween<Size>(
//       begin: Size(widget.startWidth, widget.startHeight),
//       end: Size(widget.endWidth, widget.endHeight),
//     ).animate(
//       // Curves.linear: move between begin and end in the same speed (default)
//       // Curves.easeIn
//       // Curves.fastOutSlowIn: start slow and end fast
//       CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn),
//     );
//     // _heightAnimation.addListener(() => setState(() {})); // to redraw the screen

//     _opacityAnimation = Tween(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(
//       // Curves.linear: move between begin and end in the same speed (default)
//       // Curves.easeIn
//       // Curves.fastOutSlowIn: start slow and end fast
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );

//      _slideAnimation = Tween<Offset>(
//       begin: Offset(0, -1.5),
//       end: Offset(0, 0),
//     ).animate(
//       // Curves.linear: move between begin and end in the same speed (default)
//       // Curves.easeIn
//       // Curves.fastOutSlowIn: start slow and end fast
//       CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _animationController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // * rebuild part if ui only
//     return AnimatedBuilder(
//       animation: _heightAnimation,
//       builder: (context, ch) {
//         return Container(
//           height: _heightAnimation.value.height,
//           constraints: BoxConstraints(minHeight: _heightAnimation.value.height),
//           child: ch,
//         );
//       },
//       // * This part wont be rebuild
//       child: Column(children: [
//         ElevatedButton(
//           onPressed: () {
//             _animationController.forward(); // start animation
//           },
//           child: const Text('start'),
//         ),
//         AnimatedContainer(
//           constraints: BoxConstraints(
//             minHeight: 1 == 1 ? 60 : 0,
//             maxHeight: 1 == 1 ? 120 : 0,
//           ),
//           curve: Curves.easeIn,
//           duration: Duration(milliseconds: 300),
//           child: FadeTransition(
//               opacity: _opacityAnimation,
//               child: SlideTransition(
//                 position: _slideAnimation,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _animationController.reverse(); // reverse animation
//                   },
//                   child: const Text('back'),
//                 ),
//               )),
//         ),
//       ]),
//     );
//   }
// }
