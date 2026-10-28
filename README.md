# DuoDock 🚀

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.5-blue.svg?style=for-the-badge" alt="Version 1.0.5" />
  <img src="https://img.shields.io/badge/iOS-15.0%20--%2016.7.x-success.svg?style=for-the-badge" alt="iOS Compatibility" />
  <img src="https://img.shields.io/badge/Architecture-Rootless%20%2F%20arm64-orange.svg?style=for-the-badge" alt="Architecture" />
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="License MIT" />
</p>

<p align="center">
  <b>Tweak thanh Dock dọc dạng viên thuốc độc lập kèm nút tìm kiếm Spotlight thông minh dành cho iOS 15.0 - 16.7.x</b><br>
  <i>Modern vertical capsule pill dock tweak with dynamic Spotlight search button for iOS 15 - 16 (Rootless Dopamine / palera1n / XinaA15).</i>
</p>

---

## 🌟 Giới thiệu / Overview

**DuoDock** biến đổi hoàn toàn thanh Dock nằm ngang truyền thống của iOS thành một thanh Dock dọc dạng viên thuốc mềm mại bám cạnh màn hình (trái hoặc phải), tối ưu không gian hiển thị và đem lại trải nghiệm đa nhiệm hiện đại. 

Khác với các tweak dock trôi nổi dễ gây xung đột hoặc đơ cảm ứng, **DuoDock** can thiệp trực tiếp vào `SBDockView` và `SBRootFolderView` gốc của SpringBoard:
- **Không bao giờ cướp touch (Safe Touch Passthrough)**: Giữ nguyên vẹn 100% cảm ứng của icon màn hình chính và AssistiveTouch.
- **Không gây Safe Mode**: Tương thích hoàn hảo với vi xử lý A10 Fusion (iPhone 7 / 7 Plus) cũng như các dòng chip mới hơn chạy iOS 15 - 16.
- **Tích hợp nút tìm kiếm Spotlight độc lập**: Mở nhanh Spotlight ngay cạnh thanh Dock với hiệu ứng nhún lò xo và rung phản hồi Haptic.

---

## ✨ Tính năng nổi bật / Key Features

### 1. Thanh Dock dọc viên thuốc độc lập (Vertical Pill Dock)
- **Tùy chọn bám cạnh**: Đặt Dock ở **Cạnh Trái** hoặc **Cạnh Phải** màn hình.
- **Kích thước tùy biến hoàn toàn**:
  - Chiều rộng (*Width*): 50 - 95 pt
  - Chiều cao (*Height*): 180 - 450 pt
  - Khoảng cách lề mép (*Margin*): 0 - 30 pt
  - Vị trí dọc (*Offset Y*): Căn giữa hoặc dịch chuyển linh hoạt
  - Bo góc (*Corner Radius*): Tùy chỉnh độ cong viên thuốc mềm mại (Continuous Curve).

### 2. Phong cách kính mờ & Đổ bóng 3D (Deep Dock Styling)
- **4 Kiểu nền kính mờ cao cấp**:
  - **Kính Tối (Dark Frosted Glass)**: Đậm đà, sang trọng trên hình nền sáng.
  - **Kính Sáng (Light Frosted Glass)**: Tươi sáng, tinh tế trên hình nền tối.
  - **Siêu Mỏng (Ultra Thin Glass)**: Hiệu ứng kính mờ trong vắt hiện đại.
  - **Trong Suốt (Fully Transparent)**: Giấu hoàn toàn nền, chỉ hiển thị icon trôi nổi.
- **Độ trong suốt (Alpha)**: Thanh trượt tinh chỉnh độ mờ từ 0.1 đến 1.0.
- **Đường viền sáng (Capsule Border)**: Tùy chỉnh độ dày viền 0.5 - 3.0 pt tạo điểm nhấn viền nổi.
- **Đổ bóng 3D (3D Shadow)**: Đổ bóng CoreAnimation được tăng tốc phần cứng GPU, tăng chiều sâu và độ tương phản.

### 3. Nút tìm kiếm Spotlight thông minh (Dynamic Spotlight Search Button)
- **Nút tròn kính mờ**: Chạm vào để kích hoạt Spotlight Search tức thì.
- **Hiệu ứng vật lý**: Nhún lò xo nảy đàn hồi (Spring Animation) kèm rung haptic nhẹ nhàng.
- **Vị trí thông minh (Smart Dynamic Placement)**:
  - **Tự động (Auto Switch)**: Khi Dock bị kéo sát cạnh đáy màn hình, nút tìm kiếm sẽ **tự động đảo vị trí lên TRÊN đỉnh Dock** để không bị che khuất hoặc đè lên mép đáy.
  - **Cố định theo ý muốn**: Luôn ở Dưới Dock hoặc Luôn ở Trên Dock.
- **Đồng bộ phong cách nền (Sync With Dock)**:
  - Tự động đồng bộ 100% phong cách kính (Kính tối / Kính sáng / Siêu mỏng / Trong suốt), độ mờ, viền sáng và đổ bóng của nút tìm kiếm theo đúng thanh Dock.
- **Tùy biến màu biểu tượng kính lúp (Custom Search Icon Color)**:
  - Hỗ trợ các màu: **Trắng**, **Đen**, **Xám**, **Xanh Lam**, **Đỏ**, hoặc **Tự Động** (tự đảo màu tương phản với nền kính).
- **Kiến trúc Singleton vững chắc**: Đảm bảo toàn bộ màn hình chỉ xuất hiện duy nhất 1 nút tìm kiếm chuẩn xác.

### 4. Bố trí màn hình chính thông minh (Auto Grid Margin)
- **Chống đè icon (Anti-overlap)**: Tự động lùi lề lưới icon trang chủ sang trái/phải tương ứng với độ rộng của thanh Dock.
- **Mở rộng hàng icon đáy (Expand Bottom Rows)**: Tận dụng phần diện tích đáy màn hình trống (nơi dock ngang cũ từng chiếm chỗ) để mở rộng không gian cho các trang icon.
- **Số lượng icon linh hoạt**: Hỗ trợ từ **2 đến 8 icon** trên thanh Dock, tự động chia đều khoảng cách theo chiều cao dock.
- **Ẩn nhãn icon**: Giữ cho thanh Dock luôn gọn gàng và thẩm mỹ.

---

## 📱 Khả năng tương thích / Compatibility

- **Hệ điều hành**: iOS 15.0 - 15.8.3, iOS 16.0 - 16.7.x
- **Môi trường Jailbreak**:
  - **Rootless (Khuyên dùng)**: Dopamine, palera1n (rootless), XinaA15 v2
  - **Rootful**: palera1n (rootful)
- **Thiết bị**:
  - Hỗ trợ toàn diện từ chip **A10 Fusion** (iPhone 7, iPhone 7 Plus, iPad 6th/7th gen) đến chip **A16 Bionic** (iPhone 14 Pro, etc.).

---

## 📥 Hướng dẫn cài đặt / Installation

### Cách 1: Cài đặt trực tiếp file .deb từ GitHub Releases (Khuyên dùng)

1. Tải bản build mới nhất `DuoDock_rootless.deb` từ [GitHub Releases](https://github.com/Hoangnguyennaaa/DuoDock/releases/latest).
2. Mở file `.deb` bằng ứng dụng quản lý gói **Sileo**, **Zebra** hoặc **Filza File Manager**.
3. Chọn **Cài đặt (Get / Install)**.
4. Nhấn **Khởi động lại SpringBoard (Respring)** sau khi cài đặt hoàn tất.
5. Mở **Cài đặt (Settings)** -> chọn mục **DuoDock** để bắt đầu tùy chỉnh.

---

## ⚙️ Bảng tùy chọn cài đặt / Preferences Options

| Mục thiết lập | Kiểu điều khiển | Giá trị mặc định | Giải thích tính năng |
| :--- | :--- | :--- | :--- |
| **Kích hoạt DuoDock** | Switch | `Bật` | Bật/tắt toàn bộ tính năng Dock dọc |
| **Vị trí bám mép** | Segment | `Cạnh Phải` | Đặt Dock ở cạnh Trái hoặc Phải màn hình |
| **Số lượng icon** | Segment | `4 icon` | Hỗ trợ từ 2 đến 8 ứng dụng trên Dock |
| **Kiểu nền kính** | Segment | `Kính Tối` | Kính Tối / Kính Sáng / Siêu Mỏng / Trong Suốt |
| **Độ trong suốt nền** | Slider | `0.82` | Điều chỉnh độ mờ của viên thuốc (0.1 - 1.0) |
| **Bật viền sáng** | Switch | `Tắt` | Bật viền sáng viên thuốc bao quanh Dock |
| **Độ dày viền** | Slider | `1.0 pt` | Chiều dày viền sáng (0.5 - 3.0 pt) |
| **Đổ bóng 3D** | Switch | `Bật` | Đổ bóng nổi khối 3D tăng chiều sâu |
| **Bật nút Spotlight** | Switch | `Bật` | Hiển thị nút tìm kiếm tròn cạnh Dock |
| **Đồng bộ nền với Dock** | Switch | `Bật` | Nút tìm kiếm đồng bộ màu kính, viền và bóng với Dock |
| **Màu biểu tượng tìm kiếm** | Segment | `Trắng` | Trắng / Đen / Xám / Xanh / Đỏ / Tự Động |
| **Vị trí nút tìm kiếm** | Segment | `Tự động` | Tự động đảo lên trên khi Dock sát đáy / Dưới / Trên |
| **Kích thước nút tìm kiếm** | Slider | `48.0 pt` | Đường kính nút tìm kiếm tròn (36 - 64 pt) |
| **Vị trí dọc nút tìm kiếm** | Slider | `0.0 pt` | Tinh chỉnh độ cao của nút so với chân màn hình |
| **Thu hẹp lề lưới icon** | Switch | `Bật` | Tự động lùi lề màn hình chính tránh bị Dock đè |
| **Mở rộng icon xuống đáy** | Switch | `Bật` | Cho phép icon chính lấp đầy vùng đáy màn hình |
| **Khởi động lại (Respring)** | Button | — | Áp dụng tức thì các thay đổi hệ thống |
| **Khôi phục mặc định** | Button | — | Đặt lại toàn bộ thông số về cấu hình ban đầu |

---

## 🛠️ Hướng dẫn tự biên dịch / Build from Source

### Yêu cầu môi trường
- macOS 13+ (Ventura, Sonoma, Sequoia)
- Xcode Command Line Tools
- `ldid` và `dpkg` (cài qua `brew install ldid dpkg`)

### Các bước biên dịch

```bash
# 1. Clone repository
git clone https://github.com/Hoangnguyennaaa/DuoDock.git
cd DuoDock

# 2. Cấp quyền thực thi cho script đóng gói
chmod +x build_deb.sh

# 3. Biên dịch và tạo file .deb Rootless
./build_deb.sh
```

Sau khi hoàn tất, file `DuoDock_rootless.deb` sẵn sàng để cài đặt sẽ xuất hiện ngay tại thư mục gốc.

---

## 📄 Bản quyền / License

Dự án được phân phối dưới giấy phép mã nguồn mở **MIT License**. Xem chi tiết tại [LICENSE](LICENSE).
*Lưu ý, Phần mềm đang được phát triển và có thể gặp lỗi, bạn phải tự chịu trách nhiệm với hành động của bạn. Thiết bị tác giả sử dụng : iPhone 7 Plus - IOS 15.8.8, Jb Dopamine
---

<p align="center">
  Phát triển với ❤️ bởi <b>Hoangnguyen</b>
</p>
