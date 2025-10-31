GameHub – Nền tảng trò chơi Flutter
Giới thiệu

GameHub là một ứng dụng di động đa nền tảng được xây dựng bằng Flutter. Ứng dụng cung cấp nhiều trò chơi đơn giản để người dùng giải trí. Dự án sử dụng bộ thư viện Flutter SDK 3.9+ và các gói bổ trợ như rive để hiển thị animation, sudoku_solver_generator để tạo và giải Sudoku, và bộ biểu tượng cupertino_icons
github.com
. Mã nguồn của dự án nằm trong thư mục lib/ với kiến trúc rõ ràng, dễ mở rộng.

Tính năng chính

Màn hình đăng nhập: Giao diện đăng nhập với hiệu ứng gấu động (bear3.riv) được điều khiển bằng state machine của Rive. Người dùng nhập tên và mật khẩu; hiệu ứng mắt và tay của gấu thay đổi theo thao tác.

Trang chủ (HomeScreen): Hiển thị banner chào mừng, thông tin về các trò chơi và danh sách các game có sẵn. Người dùng có thể bấm vào từng banner để xem mô tả và hướng dẫn chơi.

Trò chơi Tic Tac Toe: Game cờ caro truyền thống dành cho 2 người chơi. Ứng dụng hiển thị bảng 3×3, cập nhật điểm số, kiểm tra người thắng và cho phép chơi lại.

Trò chơi Sudoku: Cung cấp bảng 9×9 với ba mức độ khó (Dễ, Trung bình, Asian). Người chơi điền số vào ô trống; chương trình kiểm tra lỗi, hỗ trợ chọn số và thông báo khi hoàn thành. Trò chơi sử dụng gói sudoku_solver_generator để tạo bảng và lời giải
github.com
.

Leaderboard: Trang bảng xếp hạng minh hoạ với danh sách người chơi, điểm số và huy hiệu thứ hạng.

Giao diện tối (Dark theme): Tất cả màn hình đều sử dụng chủ đề tối với màu tím làm điểm nhấn, kết hợp font Poppins để tăng tính thẩm mỹ.

Cài đặt và chạy dự án

Yêu cầu:

Dart/Flutter SDK version ≥ 3.9
github.com
.

Trình mô phỏng hoặc thiết bị Android/iOS để chạy ứng dụng.

Tải mã nguồn:

# Clone dự án
git clone https://github.com/RuleOfNight/2025_LTTBDD_N05_Nhom_6.git
cd 2025_LTTBDD_N05_Nhom_6


Cài đặt phụ thuộc:

flutter pub get


Chạy ứng dụng:

# Chạy trên thiết bị mặc định
flutter run

# Hoặc chỉ định thiết bị
flutter run -d <DEVICE_ID>


Ứng dụng sẽ khởi động với màn hình đăng nhập; sử dụng tài khoản mặc định admin/admin (thay đổi trong lib/login/LoginScreen.dart nếu cần).

Cấu trúc thư mục

lib/ – mã nguồn chính của ứng dụng.

main.dart – điểm khởi chạy, cấu hình chủ đề và định nghĩa GamePlatformApp.

login/ – chứa màn hình đăng nhập và các tài nguyên liên quan.

screens/ – các màn hình chính: HomeScreen, GameScreen, LeaderboardScreen.

games/ – cài đặt từng game (tictoc.dart, sudoku.dart), dễ dàng mở rộng thêm trò chơi mới.

assets/ – hình ảnh, biểu tượng và animation; được khai báo trong pubspec.yaml
github.com
.

fonts/ – font Poppins sử dụng cho giao diện
github.com
.

Giấy phép

Dự án hiện chưa chỉ định giấy phép cụ thể. Bạn có thể sử dụng mã nguồn với mục đích học tập và phi thương mại. Nếu muốn tái phát hành hoặc sử dụng vào mục đích thương mại, vui lòng liên hệ tác giả.

Liên hệ

Tác giả: Nhóm 6 – Lập trình thiết bị di động.
Email liên hệ: example@example.com

Chúc bạn có trải nghiệm vui vẻ với GameHub!
