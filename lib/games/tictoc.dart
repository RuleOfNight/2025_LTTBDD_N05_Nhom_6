import 'package:flutter/material.dart';

class TicTocGame extends StatefulWidget {
  const TicTocGame({super.key});

  @override
  State<TicTocGame> createState() => _TicTocGameState();
}

class _TicTocGameState extends State<TicTocGame> {
  bool luot = true; // true la X, false la O
  bool troChoiCheck = false;

  List<String> mangXO = List.filled(9, "");
  int diemX = 0;
  int diemO = 0;
  int daDanhDau = 0;

  Widget _diemSo(String ben, int diem, Color mau) {
    return Row(
      children: [
        Text(
          ben,
          style: TextStyle(
            color: mau,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 15),
        const Text(":", style: TextStyle(color: Colors.white, fontSize: 25)),
        SizedBox(width: 15),
        Text(
          diem.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void nhanVao(int index) {
    setState(() {
      mangXO[index] = luot ? 'X' : 'O';
      daDanhDau++;
      luot = !luot;
      kiemTraNguoiThang();
    });
  }

  void choiLai() {
    setState(() {
      mangXO = List.filled(9, "");
      daDanhDau = 0;
      luot = true;
      troChoiCheck = false;
    });
  }

  void kiemTraNguoiThang() {
    String nguoiThang = '';
    List<List<int>> truongHopThang = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var x in truongHopThang) {
      if (mangXO[x[0]] != "" &&
          mangXO[x[0]] == mangXO[x[1]] &&
          mangXO[x[0]] == mangXO[x[2]]) {
        nguoiThang = mangXO[x[0]];
        break;
      }
    }

    if (nguoiThang != "") {
      troChoiCheck = true;
      Color mauWin = Colors.red;
      if (nguoiThang == 'X') {
        diemX++;
        mauWin = Colors.red;
      } else if (nguoiThang == 'O') {
        diemO++;
        mauWin = Colors.blue;
      }

      hienThiThongBao(
        "Chúc mừng",
        "Người chơi ${(nguoiThang)} đã chiến thắng!",
        mauWin,
      );
    } else if (daDanhDau == 9) {
      troChoiCheck = true;
      hienThiThongBao("Haizzza!!", "Lại hòa rồi :v", Colors.yellow);
    }
  }

  hienThiThongBao(String tieuDe, String noiDung, Color? mau) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A2E),
          title: Text(
            tieuDe,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mau,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            noiDung,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          actions: [
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFE94560),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  choiLai();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Chơi Lại",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1E),
      appBar: AppBar(
        title: const Text('Tic Tac Toe', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _diemSo("X", 20, Colors.red),
                  Column(
                    children: [
                      Text(
                        "Lượt hiện tại",
                        style: TextStyle(color: Colors.grey[300], fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: luot ? Colors.red : Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          luot ? "X" : "O",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _diemSo("O", 20, Colors.blue),
                ],
              ),
            ),

            // Luoi caro
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          nhanVao(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF16213E),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.5),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              mangXO[index],
                              style: TextStyle(
                                color: mangXO[index] == 'X'
                                    ? Colors.red
                                    : Colors.blue,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Nut choi lai,
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: choiLai,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE94560),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Chơi Lại',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
