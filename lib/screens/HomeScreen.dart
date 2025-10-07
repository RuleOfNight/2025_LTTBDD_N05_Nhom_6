import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
		appBar: _buildAppBar(),
		body: SingleChildScrollView(
			child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				_buildBanner(context),
				const SizedBox(height: 20),
			],
			),
		),
		);
	}

	AppBar _buildAppBar() {
		return AppBar(
		title: const Text(
			'GameHub',
			style: TextStyle(fontWeight: FontWeight.bold),
		),
		actions: [
			IconButton(
			icon: const Icon(Icons.notifications),
			onPressed: () {
				// lazy
			},
			),
		],
		);
	}

	Widget _buildBanner(BuildContext context) {
	return Container(
		margin: const EdgeInsets.all(16),
		height: 180,
		decoration: BoxDecoration(
		borderRadius: BorderRadius.circular(20),
		gradient: const LinearGradient(
			colors: [Color(0xFF6B46C1), Color(0xFF9333EA)],
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
		),
		),
		child: Stack(
		children: [
			Positioned(
			right: -20,
			top: -20,
			child: Icon(
				Icons.sports_esports,
				size: 180,
				color: Colors.white.withOpacity(0.1),
			),
			),
		],
		),
	);
	}
}
