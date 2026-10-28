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

> [!WARNING]
> ### ⚠️ Tuyên bố miễn trừ trách nhiệm / Disclaimer
> - **DuoDock** được phát triển và chia sẻ hoàn toàn miễn phí vì mục đích nghiên cứu, học tập và cá nhân hóa giao diện người dùng.
> - Việc bẻ khóa (Jailbreak) và can thiệp vào tệp hệ thống iOS luôn tiềm ẩn rủi ro nhất định. **Người dùng tự chịu hoàn toàn trách nhiệm đối với thiết bị của mình khi tiến hành cài đặt và sử dụng tweak này.**
> - Tác giả **không chịu bất kỳ trách nhiệm pháp lý hoặc nghĩa vụ bồi thường nào** đối với các sự cố kỹ thuật có thể xảy ra, bao gồm nhưng không giới hạn ở: treo máy (bootloop), xung đột tweak dẫn đến Safe Mode, mất mát dữ liệu hoặc các lỗi phần mềm/phần cứng khác. Hãy luôn sao lưu dữ liệu quan trọng trước khi cài đặt.

---

## 📸 Hình ảnh minh họa / Screenshots Demo

<!-- 
  HƯỚNG DẪN CHÈN ẢNH:
  1. Thêm ảnh chụp màn hình của bạn vào thư mục: assets/screenshots/
     (ví dụ: assets/screenshots/home.png, assets/screenshots/spotlight.png, assets/screenshots/settings.png)
  2. Thay thế đường dẫn placeholder bên dưới bằng tên tệp ảnh thật của bạn.
-->

<p align="center">
  <table align="center">
    <tr>
      <td align="center" width="33%">
        <b>Màn hình chính & Dock dọc</b><br>
        <i>Vertical Pill Dock</i><br><br>
        <img src="assets/screenshots/screenshot_dock.png" alt="Demo Dock dọc" width="240" onerror="this.src='https://via.placeholder.com/240x480?text=Ch%C3%A8n+%E1%BA%A3nh+Dock+d%E1%BB%8Dc+t%E1%BA%A1i+%C4%91%C3%A2y';"><br>
        <sub>Đặt bám mép phải/trái</sub>
      </td>
      <td align="center" width="33%">
        <b>Nút tìm kiếm Spotlight</b><br>
        <i>Dynamic Search Button</i><br><br>
        <img src="assets/screenshots/screenshot_search.png" alt="Demo Nút tìm kiếm" width="240" onerror="this.src='https://via.placeholder.com/240x480?text=Ch%C3%A8n+%E1%BA%A3nh+Spotlight+t%E1%BA%A1i+%C4%91%C3%A2y';"><br>
        <sub>Đảo vị trí thông minh</sub>
      </td>
      <td align="center" width="33%">
        <b>Giao diện Cài đặt (Settings)</b><br>
        <i>Preferences Panel</i><br><br>
        <img src="assets/screenshots/screenshot_settings.png" alt="Demo Cài đặt" width="240" onerror="this.src='https://via.placeholder.com/240x480?text=Ch%C3%A8n+%E1%BA%A3nh+C%C3%A0i+%C4%91%E1%BA%B7t+t%E1%BA%A1i+%C4%91%C3%A2y';"><br>
        <sub>Đầy đủ tùy biến trực quan</sub>
      </td>
    </tr>
  </table>
</p>

---

## 🌟 Giới thiệu / Overview

**DuoDock** biến đổi hoàn toàn thanh Dock nằm ngang truyền thống của iOS thành một thanh Dock dọc dạng viên thuốc mềm mại bám cạnh màn hình (trái hoặc phải), tối ưu không gian hiển thị và đem lại trải nghiệm đa nhiệm hiện đại. 

Khác với các tweak dock trôi nổi dễ gây xung đột hoặc đơ cảm ứng, **DuoDock** can thiệp trực tiếp vào `SBDockView` và `SBRootFolderView` gốc của SpringBoard:
- **Không bao giờ cướp touch (Safe Touch Passthrough)**: Giữ nguyên vẹn 100% cảm ứng của icon màn hình chính và AssistiveTouch.
- **Không gây Safe Mode**: Tương thích hoàn hảo với vi xử lý A10 Fusion (iPhone 7 / 7 Plus) cũng như các dòng chip mới hơn chạy iOS 15 - 16.
- **Tích hợp nút tìm kiếm Spotlight độc lập**: Mở nhanh Spotlight ngay cạnh thanh Dock với hiệu ứng nhún lò xo và rung phản hồi Haptic.

---

## 📱 Thiết bị đã thử nghiệm thực tế / Tested Devices

Tweak đã trải qua các đợt kiểm thử thực tế kỹ lưỡng trên môi trường phần cứng và phần mềm cụ thể sau:

| Thông số kiểm tra | Chi tiết thiết bị thử nghiệm |
| :--- | :--- |
| **Thiết bị (Device)** | **iPhone 7 Plus** (Mã phần cứng: `iPhone9,2` / `iPhone9,4`) |
| **Vi xử lý (Chipset)** | **Apple A10 Fusion** (Kiến trúc ARM64) |
| **Hệ điều hành (iOS Version)** | **iOS 15.8.2 / iOS 15.8.3** |
| **Môi trường Jailbreak** | **Dopamine v2.x (Rootless)** |
| **Quản lý gói (Package Manager)** | **Sileo v2.5+** / **Zebra** |
| **Kết quả kiểm tra thực tế** | **Hoạt động hoàn hảo 100%**:<br>• Không lag giật, không nóng máy.<br>• Màn hình chính vuốt chạm mượt mà, AssistiveTouch không bị chặn.<br>• Nút Spotlight nảy lò xo và mở tức thì.<br>• Respring an toàn, tuyệt đối không bị văng Safe Mode. |

*Ngoài thiết bị thử nghiệm thực tế trên, tweak tương thích tốt với mọi thiết bị ARM64 chạy iOS 15.0 đến 16.7.x (từ iPhone 6s/SE 1 đến iPhone 14 Pro Max).*

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

## 📥 Hướng dẫn cài đặt / Installation

### Cách cài đặt file .deb trực tiếp từ GitHub Releases (Khuyên dùng)

1. Tải bản build mới nhất `DuoDock_rootless.deb` từ [GitHub Releases](https://github.com/Hoangnguyennaaa/DuoDock/releases/latest).
2. Mở file `.deb` bằng ứng dụng quản lý gói **Sileo**, **Zebra** hoặc **Filza File Manager**.
3. Chọn **Cài đặt (Get / Install)**.
4. Nhấn **Khởi động lại SpringBoard (Respring)** sau khi cài đặt hoàn tất.
5. Mở **Cài đặt (Settings)** -> chọn mục **DuoDock** để bắt đầu tùy chỉnh theo sở thích.

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
- `ldid` và `dpkg` (cài đặt qua: `brew install ldid dpkg`)

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

Sau khi hoàn tất, file `DuoDock_rootless.deb` sẵn sàng cài đặt sẽ được tạo trực tiếp ngay tại thư mục gốc.

---

## 💖 Ủng hộ nhà phát triển / Donate & Support

Nếu bạn yêu thích **DuoDock** và cảm thấy tweak này hữu ích cho trải nghiệm hằng ngày của bạn, bạn có thể ủng hộ tác giả một ly cà phê để tiếp thêm động lực phát triển và duy trì dự án!

<!-- 
  HƯỚNG DẪN CHÈN ẢNH QR:
  1. Đặt ảnh mã QR ngân hàng hoặc ví MoMo vào: assets/donations/
     (ví dụ: assets/donations/banking_qr.png hoặc assets/donations/momo_qr.png)
  2. Cập nhật thông tin số tài khoản của bạn ở bảng bên dưới.
-->

<p align="center">
  <table align="center">
    <tr>
      <td align="center" width="50%">
        <b>Chuyển khoản Ngân hàng (QR Banking)</b><br><br>
        <img src="assets/donations/banking_qr.png" alt="Mã QR Chuyển khoản Ngân hàng" width="220" onerror="this.src='https://via.placeholder.com/220x220?text=Ch%C3%A8n+QR+Ng%C3%A2n+H%C3%A0ng+t%E1%BA%A1i+%C4%91%C3%A2y';"><br><br>
        <b>Ngân hàng</b>: <code>[Tên Ngân Hàng, ví dụ: MBBank / VCB]</code><br>
        <b>Số tài khoản</b>: <code>[Số tài khoản của bạn]</code><br>
        <b>Chủ tài khoản</b>: <code>[Tên chủ tài khoản]</code>
      </td>
      <td align="center" width="50%">
        <b>Ví điện tử MoMo (MoMo QR)</b><br><br>
        <img src="assets/donations/momo_qr.png" alt="Mã QR Ví MoMo" width="220" onerror="this.src='https://via.placeholder.com/220x220?text=Ch%C3%A8n+QR+MoMo+t%E1%BA%A1i+%C4%91%C3%A2y';"><br><br>
        <b>Ví MoMo</b>: <code>[Số điện thoại MoMo]</code><br>
        <b>Chủ tài khoản</b>: <code>[Tên người nhận]</code><br>
        <b>Nội dung chuyển</b>: <code>Ung ho DuoDock</code>
      </td>
    </tr>
  </table>
</p>

*Mọi sự ủng hộ và đóng góp ý kiến của các bạn đều là nguồn động viên rất lớn cho đội ngũ phát triển! Cảm ơn bạn rất nhiều!*

---

## 📄 Bản quyền / License

Dự án được phân phối dưới giấy phép mã nguồn mở **MIT License**. Xem chi tiết tại [LICENSE](LICENSE).
*Lưu ý, Phần mềm đang được phát triển và có thể gặp lỗi, bạn phải tự chịu trách nhiệm với hành động của bạn. Thiết bị tác giả sử dụng : iPhone 7 Plus - IOS 15.8.8, Jb Dopamine
---

<p align="center">
  Phát triển với ❤️ bởi <b>Hoangnguyen</b>
</p>
