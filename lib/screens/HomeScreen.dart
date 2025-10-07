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

	void _showGameInfoDialog(BuildContext context, String? name, String? description, String? instructions) {
		String gameImage;
		switch (name) {
			case 'Tic Tac Toe':
			gameImage = 'imgs/screenshot_1759767094.png';
			break;
			case 'Sudoku':
			gameImage = 'imgs/screenshot_1759767128.png';
			break;
			case 'Rắn Săn Mồi':
			gameImage = 'imgs/screenshot_1759767175.png';
			break;
			default:
			gameImage = '';
		}

		showDialog(
			context: context,
			builder: (ctx) {
			return Dialog(
				backgroundColor: const Color(0xFF1A1A2E),
				insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
				child: SingleChildScrollView(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					mainAxisSize: MainAxisSize.min,
					children: [
					_buildDialogHeader(name),
					_buildDialogImage(gameImage),
					_buildDialogContent(description, instructions),
					],
				),
				),
			);
			},
		);
	}

	Widget _buildDialogHeader(String? name) {
	return Container(
		padding: const EdgeInsets.all(16),
		decoration: const BoxDecoration(
		color: Color(0xFF2A2A3E),
		borderRadius: BorderRadius.only(
			topLeft: Radius.circular(12),
			topRight: Radius.circular(12),
		),
		),
		child: Text(
		name ?? '',
		textAlign: TextAlign.center,
		style: const TextStyle(
			fontSize: 28,
			fontFamily: 'Poppins-SemiBoldItalic',
			color: Colors.white,
			letterSpacing: 1.2,
		),
		),
	);
	}

	Widget _buildDialogImage(String gameImage) {
	return Container(
		height: 200,
		margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
		decoration: BoxDecoration(
		color: Colors.grey.shade800,
		borderRadius: BorderRadius.circular(12),
		),
		child: ClipRRect(
		borderRadius: BorderRadius.circular(12),
		child: Image.asset(
			gameImage,
			fit: BoxFit.cover,
			errorBuilder: (context, error, stackTrace) {
			return const Center(
				child: Icon(
				Icons.image_not_supported,
				color: Colors.white54,
				size: 50,
				),
			);
			},
		),
		),
	);
	}

	Widget _buildDialogContent(String? description, String? instructions) {
	return Padding(
		padding: const EdgeInsets.all(16),
		child: Column(
		crossAxisAlignment: CrossAxisAlignment.start,
		children: [
			const Text(
			'Mô tả:',
			style: TextStyle(
				fontSize: 20,
				fontWeight: FontWeight.bold,
				color: Colors.white,
				letterSpacing: 0.5,
			),
			),
			const SizedBox(height: 8),
			Text(
			description ?? '',
			style: const TextStyle(
				fontSize: 16,
				color: Colors.white70,
				height: 1.5,
			),
			),
			const SizedBox(height: 20),
			const Text(
			'Hướng dẫn chơi:',
			style: TextStyle(
				fontSize: 20,
				fontWeight: FontWeight.bold,
				color: Colors.white,
				letterSpacing: 0.5,
			),
			),
			const SizedBox(height: 8),
			Text(
			instructions ?? '',
			style: const TextStyle(
				fontSize: 16,
				color: Colors.white70,
				height: 1.5,
			),
			),
		],
		),
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
			'description': 'Tic Tac Toe là trò chơi đơn giản, nơi bạn cần xếp 3 ký tự liên tiếp để thắng.',
			'instructions': 'Chọn ô để đánh dấu X hoặc O. Người chơi nào xếp được 3 ký tự liên tiếp trước sẽ thắng, bạn cũng có thể chặn người chơi khác lại bằng dấu của mình.',
			},
			{
			'name': 'Sudoku',
			'icon': Icons.calculate,
			'color': Colors.teal,
			'image': 'imgs/screenshot_1759767128.png',
			'description': 'Sudoku là trò chơi giải đố với bảng 9x9, nơi bạn cần điền số từ 1 đến 9.',
			'instructions': 'Điền số vào các ô trống sao cho mỗi hàng, cột và ô 3x3 không có số trùng lặp.',
			},
			{
			'name': 'Rắn Săn Mồi',
			'icon': Icons.widgets,
			'color': Colors.green,
			'image': 'imgs/screenshot_1759767175.png',
			'description': 'Nhiệm vụ của bạn là giúp con rắn thu nhập thức ăn, và giữ cho nó sống lâu nhất có thể',
			'instructions': 'Điều khiển rắn thu nhập thức ăn bằng các phím mũi tên. Tránh va vào tường hoặc chính mình.',
			},
		];

	return Column(
		children: games.map((game) {
		return GestureDetector(
			onTap: () {
			_showGameInfoDialog(
				context,
				game['name'] as String?,
				game['description'] as String?,
				game['instructions'] as String?,
			);
			},
			child: _buildGameBanner(game),
		);
		}).toList(),
	);
	}

	Widget _buildGameBanner(Map<String, dynamic> game) {
	return Container(
		margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
		height: 120,
		decoration: BoxDecoration(
		borderRadius: BorderRadius.circular(20),
		gradient: LinearGradient(
			colors: [
			(game['color'] as Color).withOpacity(0.6),
			(game['color'] as Color).withOpacity(0.3),
			],
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
		),
		),
		child: Stack(
		children: [
			Positioned.fill(
			child: Opacity(
				opacity: 0.1,
				child: Image.asset(
				game['image'] as String,
				fit: BoxFit.cover,
				),
			),
			),
			Padding(
			padding: const EdgeInsets.all(20),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
				Expanded(
					child: Text(
					game['name'] as String,
					style: const TextStyle(
						fontSize: 24,
						fontFamily: 'Poppins-SemiBoldItalic',
						color: Colors.white,
						letterSpacing: 1.2,
						shadows: [
						Shadow(
							color: Colors.black26,
							offset: Offset(2, 2),
							blurRadius: 4,
						),
						],
					),
					),
				),
				Icon(
					game['icon'] as IconData,
					size: 50,
					color: Colors.white,
				),
				],
			),
			),
		],
		),
	);
	}

}
