# Hệ thống giám sát trạm cảm biến nông trại SmartFarm Monitor

Hệ thống giám sát trạm cảm biến nông trại thông minh, hỗ trợ lọc nhật ký máy chủ và quản lý thông tin thiết bị.

## 1. Hướng dẫn chạy script

Mở Terminal trên Mac và chạy các lệnh sau:

```
cd ~/Desktop/smartfarm-system/scripts
bash auto_report.sh
```

Báo cáo sự cố được lưu tại `backup/bao-cao-su-co.txt`.

## 2. Checklist kiểm tra thiết bị

-   Kiểm tra file nhật ký hệ thống.
    
-   Kiểm tra kết nối các trạm cảm biến.
    
-   Đối soát mã linh kiện bằng hàm TRIM và VLOOKUP.
    
-   Kiểm tra dung lượng RAM và loại lưu trữ.
    
-   Kiểm tra báo cáo sự cố sau khi chạy script.
    

## 3. Bảng thông số phần cứng
## 3. Bảng thông số phần cứng

| Tên thiết bị | Đơn giá | Loại storage |
|---|---:|---|
| Raspberry Pi 4 Model B | 1.450.000 | SSD |
| Intel NUC i3 | 6.200.000 | SSD |
| Orange Pi 5 | 2.300.000 | SSD |
| Dell Optiplex Micro | 5.400.000 | HDD |
| Mini PC Fanless N100 | 4.200.000 | SSD |
| Synology DS220j NAS | 3.900.000 | HDD |
## 4. Phân tích hệ thống

### 4.1. Mô hình IPO

-   **Input (Đầu vào):** File `log-he-thong.log` chứa nhật ký máy chủ với các mức INFO, WARNING, ERROR và CRITICAL.
    
-   **Process (Xử lý):** Đọc file nhật ký, lọc các dòng chứa ERROR hoặc CRITICAL, đếm số dòng sự cố và ghi kết quả vào file báo cáo.
    
-   **Output (Đầu ra):** File `bao-cao-su-co.txt` chứa thời gian lập báo cáo, các dòng sự cố và tổng số sự cố.
    

### 4.2. Mô hình DIKW

-   **Data (Dữ liệu) – (b):**  `2026-10-12 08:15:01 [ERROR] sensor-03 Connection TIMEOUT after 30s`. Đây là một dòng nhật ký thô của hệ thống.
    
-   **Information (Thông tin) – (c):** Hôm nay hệ thống ghi nhận 8 sự cố, trong đó 4 sự cố đến từ trạm sensor-03. Dữ liệu đã được tổng hợp thành thông tin có ý nghĩa.
    
-   **Knowledge (Tri thức) – (d):** Trạm sensor-03 thường mất kết nối vào buổi chiều do sóng yếu, nên cần lắp thêm ăng-ten. Đây là nhận định về nguyên nhân và hướng xử lý.
    
-   **Wisdom (Trí tuệ) – (a):** Quyết định thay modem trạm sensor-03 trước thứ Sáu. Đây là quyết định hành động dựa trên thông tin và tri thức.
    

## 5. Cấu trúc dự án


```text
smartfarm-system/
├── .env
├── docs/
│   └── README.md
├── scripts/
│   └── auto_report.sh
├── data/
│   ├── log-he-thong.log
│   └── quan-ly-thiet-bi.xlsx
└── backup/
    └── bao-cao-su-co.txt
```

