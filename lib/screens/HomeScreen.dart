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
				_buildTitle('About our games'),
				_buildGameBanners(context),
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
			Padding(
			padding: const EdgeInsets.all(20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.center,
				children: const [
				Text(
					'Chào mừng đến GameHub',
					style: TextStyle(
					fontSize: 16,
					color: Colors.white70,
					),
				),
				SizedBox(height: 8),
				Text(
					'Bạn cần đạt 5tr sức mạnh\ntrong Rise Of Kingdoms để skip QC',
					style: TextStyle(
					fontSize: 20,
					fontWeight: FontWeight.bold,
					color: Colors.white,
					),
				),
				],
			),
			),
		],
		),
	);
	}

	Widget _buildTitle(String title) {
	return Padding(
		padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
		child: Text(
		title,
		style: const TextStyle(
			fontSize: 22,
			fontWeight: FontWeight.bold,
			color: Colors.white,
		),
		),
	);
	}

	Widget _buildGameBanners(BuildContext context) {
	final games = [
		{
		'name': 'Tic Tac Toe',
		'icon': Icons.grid_3x3,
		'color': Colors.blue,
		'image': 'imgs/screenshot_1759767094.png',
		'description': '',
		'instructions': '',
		},
		{
		'name': 'Sudoku',
		'icon': Icons.calculate,
		'color': Colors.teal,
		'image': 'imgs/screenshot_1759767128.png',
		'description': '',
		'instructions': '',
		},
		{
		'name': 'Rắn Săn Mồi',
		'icon': Icons.widgets,
		'color': Colors.green,
		'image': 'imgs/screenshot_1759767175.png',
		'description': '',
		'instructions': '',
		},
	];

	return Column(
		children: games.map((game) {
		return _buildGameBanner(game);
		}).toList(),
	);
	}

	Widget _buildGameBanner(Map<String, dynamic> game) {
	return Container(
		margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
		height: 120,
		color: game['color'] as Color,
	);
	}

}
