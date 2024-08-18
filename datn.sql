-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 07, 2024 lúc 09:45 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `datn`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertProductEntries` ()   BEGIN
    -- Declare variables to store counts
    SET @total_count = (SELECT COUNT(*) FROM product WHERE prodType = 'Laptop');
    SET @quarter_count = CEIL(@total_count / 4);

    -- Tạo bản ghi trong bảng product_entry với ramID = 1
    SET @sql1 = CONCAT('
        INSERT INTO product_entry (prodID, ramID)
        SELECT prodID, 1
        FROM product
        WHERE prodType = ''Laptop''
        ORDER BY prodID
        LIMIT ', @quarter_count);
    PREPARE stmt1 FROM @sql1;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    -- Tạo bản ghi trong bảng product_entry với ramID = 2
    SET @sql2 = CONCAT('
        INSERT INTO product_entry (prodID, ramID)
        SELECT prodID, 2
        FROM product
        WHERE prodType = ''Laptop''
        ORDER BY prodID
        LIMIT ', @quarter_count, ' OFFSET ', @quarter_count);
    PREPARE stmt2 FROM @sql2;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;

    -- Tạo bản ghi trong bảng product_entry với ramID = 3
    SET @sql3 = CONCAT('
        INSERT INTO product_entry (prodID, ramID)
        SELECT prodID, 3
        FROM product
        WHERE prodType = ''Laptop''
        ORDER BY prodID
        LIMIT ', @quarter_count, ' OFFSET ', @quarter_count * 2);
    PREPARE stmt3 FROM @sql3;
    EXECUTE stmt3;
    DEALLOCATE PREPARE stmt3;

    -- Tạo bản ghi trong bảng product_entry với ramID = 4
    SET @sql4 = CONCAT('
        INSERT INTO product_entry (prodID, ramID)
        SELECT prodID, 4
        FROM product
        WHERE prodType = ''Laptop''
        ORDER BY prodID
        LIMIT ', @quarter_count, ' OFFSET ', @quarter_count * 3);
    PREPARE stmt4 FROM @sql4;
    EXECUTE stmt4;
    DEALLOCATE PREPARE stmt4;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `bannerID` int(11) NOT NULL,
  `bannerName` varchar(100) NOT NULL,
  `bannerImg` text NOT NULL,
  `bannerType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `blogID` int(11) NOT NULL,
  `shortdesc` text DEFAULT NULL,
  `title` text NOT NULL,
  `thumbnail` text NOT NULL,
  `content` text NOT NULL,
  `postDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`blogID`, `shortdesc`, `title`, `thumbnail`, `content`, `postDate`) VALUES
(1, NULL, 'Iphone 15 blog', 'https://www.three.co.uk/blog/iphone-15-dubunking-the-rumours/_jcr_content/root/container/container-main-section/column-left/image_copy.coreimg.jpeg/1695741055722/cover-1690x1100px-blog-iphone-15-opt1.jpeg', '<body>\n    <div style=\"width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;\">\n        <div style=\"width: 60%\">\n\n\n            <div style=\"width: 100%; display: flex; justify-content: space-between;\">\n                <div style=\"width: 50%;\">\n                    <h1 style=\"font-size: 2x1;\">Apple ra mắt iPhone 15 Pro và iPhone 15 Pro Max</h1>\n\n                    <p style=\"font-size: 18px;\"> Sở hữu thiết kế Titan mỏng nhẹ và mạnh mẽ cùng cạnh viền mới, Nút Tác\n                        Vụ\n                        mới, nhiều nâng cấp\n                        camera\n                        mạnh mẽ, và chip A17 Pro đưa hiệu năng cũng như trải nghiệm chơi game di động lên một tầm cao\n                        mới\n                    </p>\n                </div>\n                <div style=\"width: 45%;\">\n                    <img style=\"border-radius: 15px;  width: 100%; height: 250px\"\n                        src=\"https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-hero-230912_Full-Bleed-Image.jpg.xlarge.jpg\" />\n\n                </div>\n\n            </div>\n            <div>\n                <p style=\"font-size: 18px;\"> CUPERTINO, CALIFORNIA Hôm nay, Apple đã ra mắt iPhone 15 Pro và iPhone 15\n                    Pro Max, được thiết kế\n                    bằng\n                    Titan chuẩn hàng không vũ trụ chắc chắn mà vẫn mỏng nhẹ,\n                    mang đến những mẫu Pro có trọng lượng nhẹ nhất của Apple từ trước đến nay. Thiết kế mới với cạnh\n                    viền và\n                    nút Tác Vụ có thể tuỳ chỉnh, hỗ trợ người dùng cá nhân\n                    hoá trải nghiệm với iPhone. Nhiều nâng cấp camera mạnh mẽ tương đương với bảy ống kính chuyên nghiệp\n                    mang đến chất lượng hình ảnh đáng kinh ngạc, bao gồm một camera\n                    Chính 48MP tiên tiến nay hỗ trợ độ phân giải mới cực kỳ cao lên đến 24MP ở chế độ mặc định, chụp\n                    chân\n                    dung thế hệ mới với tính năng Focus và Depth Control, nhiều cải\n                    tiến ở Chế độ Ban đêm và Smart HDR, cũng như camera Telephoto 5x hoàn toàn mới chỉ có trên iPhone 15\n                    Pro\n                    Max. Chip A17 Pro đưa trải nghiệm chơi game và hiệu năng chuyên\n                    nghiệp lên một tầm cao mới. Cổng kết nối USB-C mới được tăng tốc với tốc độ của USB 3 — nhanh hơn\n                    gấp 20\n                    lần so với USB 2 — và cùng với các định dạng video mới, giúp xử\n                    lý quy trình làm việc chuyên nghiệp một cách mạnh mẽ mà trước đây không thể thực hiện được.</p>\n                <p style=\"font-size: 18px;\">\n                    iPhone 15 Pro và iPhone 15 Pro Max sẽ có bốn màu mới tuyệt đẹp, bao gồm Titan Đen, Titan Trắng,\n                    Titan Xanh và Titan Tự Nhiên.\n                </p>\n                <p style=\"font-size: 18px;\">\n                    \"Đây là dòng sản phẩm chuyên nghiệp nhất mà chúng tôi từng tạo ra, với thiết kế hiện đại bằng Titan,\n                    hệ thống camera iPhone tiên tiến nhất tạo ra sự thay đổi cuộc chơi trong quy trình làm việc mới,\n                    đồng thời chip A17 Pro mở đường cho một chương mới về hiệu năng và các tựa game chưa từng thấy trên\n                    iPhone,\" Greg Joswiak, Phó Chủ tịch Cấp cao bộ phận Tiếp thị Toàn cầu của Apple, cho biết. \"iPhone\n                    15 Pro và iPhone 15 Pro Max đại diện cho những điều tuyệt vời nhất về thiết kế và những đổi mới hàng\n                    đầu trong ngành của Apple, làm phong phú thêm trải nghiệm hàng ngày của người dùng, đồng thời giúp\n                    họ thoả sức sáng tạo\".\n                </p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-color-lineup-geo-230912_big.jpg.large.jpg\" />\n\n            </div>\n            <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Thiết Kế Tuyệt Đẹp, Mỏng Nhẹ Và Bền Bỉ</p>\n            <div>\n                <p style=\"font-size: 18px;\"> Sở hữu kích thước màn hình 6,1 inch và 6,7 inch,2 iPhone 15 Pro và iPhone\n                    15 Pro Max có thiết kế Titan bền chắc và mỏng nhẹ — lần đầu tiên xuất hiện trên iPhone. Đây là loại\n                    hợp kim cao cấp sử dụng cho tàu vũ trụ, đồng thời là một trong những kim loại có tỷ lệ giữa độ bền\n                    và trọng lượng cao nhất, tạo nên dòng sản phẩm Pro nhẹ nhất từ trước đến nay của Apple. Cả hai kiểu\n                    máy này đều có bề mặt nhám tinh tế, các cạnh được bo tròn và viền máy mỏng nhất từng có trên iPhone.\n                    Dòng sản phẩm Pro bền bỉ với thời gian, kết hợp sức mạnh của Titan cùng kính mặt lưng bền chắc nhất\n                    trên điện thoại thông minh và mặt kính trước Ceramic Shield hàng đầu trong ngành. Sử dụng quá trình\n                    nhiệt cơ lần đầu được ứng dụng trong ngành, lớp vỏ Titan bao lấy kết cấu phụ làm từ 100% nhôm tái\n                    chế, liên kết hai kim loại này với nhau nhờ sức mạnh ấn tượng thông qua quá trình khuếch tán ở trạng\n                    thái rắn. Khung nhôm giúp tản nhiệt và cho phép thay mặt lưng kính dễ dàng. Thiết kế mới cũng làm\n                    nổi bật màn hình Super Retina XDR với công nghệ Luôn bật và ProMotion, mang đến trải nghiệm xem\n                    tuyệt đỉnh.</p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-camera-system-230912_big.jpg.large.jpg\" />\n\n            </div>\n            <div>\n                <p style=\"font-size: 18px;\">Nút Tác Vụ hoàn toàn mới thay thế nút gạt cũ chỉ có một chức năng chuyển đổi\n                    giữa đổ chuông và im lặng, mang đến nhiều tuỳ chọn bổ sung để người dùng lựa chọn giữa việc nhanh\n                    chóng bật camera hay đèn pin, kích hoạt Ghi Âm, Tập Trung, Dịch Thuật,3 và các tính năng trợ năng\n                    như Kính Lúp, hoặc dùng Phím Tắt để có thêm tuỳ chọn. Thao tác nhấn và giữ với tính năng phản hồi\n                    xúc giác được tinh chỉnh cùng các gợi ý trực quan trong Dynamic Island giúp đảm bảo nút mới sẽ khởi\n                    chạy tác vụ mong muốn.</p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <video style=\"border-radius: 15px;  width: 50%; height: 250px\" autoplay loop>\n                    <source src=\"https://www.apple.com/newsroom/videos/iphone-15-pro-action-button/large_2x.mp4\"\n                        type=\"video/mp4\">\n                </video>\n\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">A17 Pro: Thế Hệ Chip Apple Silicon Mới\n                    Cho iPhone</p>\n                <p style=\"font-size: 18px;\">\n                    Mang đến hiệu năng cùng nhiều tính năng chuyên nghiệp, iPhone 15 Pro và iPhone 15 Pro Max được trang\n                    bị chip A17 Pro, con chip 3 nanômét đầu tiên trong ngành. Tiếp nối vị thế dẫn đầu của Apple trong\n                    ngành công nghệ chip silicon cho điện thoại thông minh, chip A17 Pro mang đến nhiều cải tiến trên\n                    toàn bộ con chip, bao gồm thiết kế mới toàn diện nhất trong lịch sử của Apple đối với GPU. CPU mới\n                    nhanh hơn đến 10% với nhiều cải tiến trong vi kiến trúc và thiết kế, đồng thời Neural Engine nay\n                    cũng nhanh hơn gấp 2 lần, hỗ trợ cho các tính năng như tự động sửa và Giọng Nói Cá Nhân trong iOS\n                    17. GPU đẳng cấp chuyên nghiệp nhanh hơn tới 20%, mở ra nhiều trải nghiệm hoàn toàn mới, sở hữu\n                    thiết kế 6 lõi mới giúp tăng hiệu năng tối đa và tiết kiệm năng lượng. Nay nhờ công nghệ dò tia tăng\n                    tốc phần cứng, nhanh hơn gấp 4 lần so với công nghệ dò tia dựa trên phần mềm, iPhone 15 Pro mang đến\n                    đồ hoạ mượt mà hơn, cũng như trải nghiệm chơi game và ứng dụng AR sống động hơn. iPhone 15 Pro mang\n                    trải nghiệm chơi game chân thực đến với người dùng nhờ sở hữu nhiều tựa game sử dụng tay cầm chơi\n                    game lần đầu xuất hiện trên điện thoại thông minh như Resident Evil Village, Resident Evil 4, DEATH\n                    STRANDING DIRECTOR’S CUT và Assassin’s Creed Mirage.4\n                    Chip A17 Pro có bộ giải mã AV1 chuyên dụng, mang đến trải nghiệm video chất lượng cao hơn, tiết kiệm\n                    pin hơn khi sử dụng các dịch vụ truyền phát. Bên cạnh đó, bộ điều khiển USB mới hỗ trợ tốc độ của\n                    USB 3 lần đầu có trên iPhone, nay hỗ trợ tốc độ truyền dữ liệu cao hơn rất nhiều cũng như đầu ra\n                    video lên đến HDR 4K ở tốc độ 60 fps.\n                </p>\n\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <video style=\"border-radius: 15px;  width: 50%; height: 250px\" autoplay loop>\n                    <source src=\"https://www.apple.com/newsroom/videos/iphone-15-pro-a17-pro-gaming-chip/large_2x.mp4\"\n                        type=\"video/mp4\">\n                </video>\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Hệ Thống Camera Pro Mạnh Mẽ Giúp Sáng\n                    Tạo Toàn Diện Hơn</p>\n                <p style=\"font-size: 18px;\">\n                    Với sự kết hợp chuyên sâu giữa phần cứng và phần mềm, hệ thống camera tiên tiến trên iPhone 15 Pro\n                    và iPhone 15 Pro Max mang đến khả năng tương đương với bảy ống kính chuyên nghiệp, tất cả là nhờ có\n                    chip A17 Pro. Sở hữu sức mạnh của công nghệ nhiếp ảnh điện toán, camera Chính 48MP mới, được thiết\n                    kế dành riêng cho dòng sản phẩm Pro, giúp người dùng linh hoạt hơn nhờ độ phân giải cực kỳ cao 24MP\n                    mới ở chế độ mặc định, mang lại chất lượng hình ảnh ấn tượng với kích thước tệp tiện lợi, cực kỳ phù\n                    hợp cho việc lưu trữ và chia sẻ. Camera Chính cho phép người dùng chuyển đổi giữa ba tiêu cự phổ\n                    biến là 24mm, 28mm và 35mm, đồng thời còn cho phép chọn một trong những tiêu cự này làm giá trị mặc\n                    định mới. Ngoài ProRAW 48MP, camera Chính còn hỗ trợ hỉnh ảnh HEIF 48MP với độ phân giải cao hơn gấp\n                    4 lần. iPhone 15 Pro có camera Telephoto 3x cực rộng, còn iPhone 15 Pro Max cung cấp tính năng thu\n                    phóng quang học có phạm vi lớn nhất từ trước đến nay trên iPhone: 5x tại 120mm. Cực kỳ phù hợp để\n                    chụp cận cảnh, chụp động vật hoang dã cũng như bắt trọn các khoảnh khắc hành động từ xa, camera\n                    Telephoto mới trên iPhone 15 Pro Max có thiết kế tetraprism đột phá với công nghệ chống rung quang\n                    học kết hợp cùng mô đun dịch chuyển cảm biến 3D tự động lấy nét, công nghệ chống rung tiên tiến nhất\n                    từ trước đến nay của Apple.</p>\n\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <video style=\"border-radius: 15px;  width: 50%; height: 250px ;\" autoplay loop>\n                    <source src=\"https://www.apple.com/newsroom/videos/iphone-15-pro-camera-optical-zoom/large_2x.mp4\"\n                        type=\"video/mp4\">\n                </video>\n            </div>\n            <p style=\"font-size: 18px;\">\n                iPhone 15 Pro và iPhone 15 Pro Max sẽ có màu Titan Đen, Titan Trắng, Titan Xanh và Titan Tự Nhiên.\n                iPhone 15 Pro vẫn giữ nguyên mức giá từ 28.999.000đ hay 2.899.900đ mỗi tháng với dung lượng lưu trữ\n                128GB, 256GB, 512GB và 1TB. iPhone 15 Pro Max có mức giá từ 34.999.000đ hay 3.499.900đ mỗi tháng, với\n                dung lượng lưu trữ 256GB, 512GB và 1TB.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Apple cung cấp nhiều lựa chọn tuyệt vời để tiết kiệm và nâng cấp lên iPhone mới nhất. Để tìm hiểu thêm\n                về giá trị của thiết bị cũng như các điều khoản và điều kiện, khách hàng có thể truy cập\n                apple.com/vn/shop/trade-in.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Khách hàng ở hơn 40 quốc gia và khu vực, bao gồm Úc, Canada, Trung Quốc, Pháp, Đức, Ấn Độ, Nhật Bản,\n                Mexico, Các Tiểu vương quốc Ả Rập Thống nhất, Vương Quốc Anh và Mỹ, sẽ có thể đặt trước iPhone 15 Pro và\n                iPhone 15 Pro Max từ 5 giờ sáng theo giờ PDT vào thứ Sáu, ngày 15 tháng 9 và sẽ có hàng từ thứ Sáu, ngày\n                22 tháng 9.\n            </p>\n            <p style=\"font-size: 18px;\">\n                iPhone 15 Pro và iPhone 15 Pro Max sẽ mở bán tại Ma Cao, Malaysia, Thổ Nhĩ Kỳ, Việt Nam cũng như 17 quốc\n                gia và khu vực khác từ thứ Sáu, ngày 29 tháng 9.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Ví Vải Tinh Dệt MagSafe và Ốp Lưng Vải Tinh Dệt MagSafe sẽ có giá 1.699.000đ với năm màu dành cho dòng\n                sản phẩm iPhone 15: đen, nâu sẫm, tím mulberry, xanh thái bình dương và xanh lá đậm. Bên cạnh Ốp Lưng\n                Trong Suốt cho iPhone 15 Pro và iPhone 15 Pro Max với giá 1.429.000đ, Ốp Lưng Silicone MagSafe sẽ có giá\n                1.429.000đ với màu đen, xanh giông tố, đất sét, hồng nhạt, ổi hồng đào, cam sorbet, xanh bách diệp và\n                xanh trời đông\n            </p>\n            <p style=\"font-size: 18px;\">\n                iOS 17 sẽ ra mắt dưới dạng bản cập nhật phần mềm miễn phí vào thứ Hai, ngày 18 tháng 9.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Từ ngày 18 tháng 9, iCloud+ sẽ ra mắt hai gói mới: 6TB với mức giá 749.000đ mỗi tháng và 12TB với mức\n                giá 1.499.000đ mỗi tháng, cung cấp thêm dung lượng để lưu trữ tệp, ảnh, video cũng như chia sẻ an toàn,\n                dễ truy cập và dễ dàng hơn. Các gói mới cực kỳ phù hợp với người dùng có thư viện ảnh và video dung\n                lượng cao hoặc những người sử dụng tính năng Chia Sẻ Trong Gia Đình, đồng thời cấp quyền truy cập vào\n                các tính năng cao cấp, bao gồm Chuyển Tiếp Bảo Mật, Ẩn địa chỉ email, Custom Email Domains và hỗ trợ\n                Thiết Lập Video Bảo Mật Homekit.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Khách hàng mua iPhone 15 và iPhone 15 Plus sẽ nhận được ba tháng sử dụng Apple Arcade miễn phí khi đăng\n                ký mới.\n            </p>\n\n        </div>\n    </div>\n</body>', '2023-12-02 18:05:36'),
(2, NULL, 'Xiaomi 13T Pro 5G', 'https://xiaomiui.net/wp-content/uploads/2022/09/Xiaomi-13-pro-5G.png', '<body>\n    <div style=\"width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;\">\n        <div style=\"width: 60%;\">\n\n\n            <div style=\"width: 100%; display: flex; justify-content: space-between;\">\n                <div style=\"width: 50%;\">\n                    <h1 style=\"font-size: 2x1;\">Điện thoại Xiaomi 13 Pro 5G mới được ra mắt</h1>\n\n                    <p style=\"font-size: 18px;\"> Điện thoại Xiaomi 13 Pro một cái tên đã xuất hiện tại thị trường Việt\n                        Nam vào cuối tháng 02/2023. Máy trang bị tấm nền AMOLED sắc nét cho hiển thị chi tiết, con chip\n                        Snapdragon 8 Gen 2 cho hiệu năng mạnh mẽ và khả năng chụp ảnh hết sức ấn tượng được hỗ trợ bởi\n                        Leica.\n                    </p>\n                </div>\n                <div style=\"width: 45%;\">\n                    <img style=\"border-radius: 15px;  width: 100%; height: 250px\"\n                        src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-man-hinh-2.jpg\" />\n\n                </div>\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Hiển thị sắc nét mọi hình ảnh với tấm nền AMOLED</p>\n                <p style=\"font-size: 18px;\">Lần ra mắt này hãng điện thoại Xiaomi sẽ trang bị cho Xiaomi 13 Pro tấm nền\n                    AMOLED với kích thước 6.73 inch. Xiaomi 13 Pro hứa hẹn không làm bạn thất vọng khi đem đến cho bạn\n                    trải nghiệm hình ảnh chất lượng nhất.\n\n                </p>\n                <p style=\"font-size: 18px;\">\n                    Đi cùng với đó hãng sẽ trang bị cho điện thoại độ phân giải 2K+ (1440 x 3200 pixels), cùng tần số\n                    quét 120 Hz giúp nâng cao khả năng hiển thị cũng như vuốt chạm diễn ra một cách mượt mà.\n                </p>\n                <p style=\"font-size: 18px;\">\n                    Thiết kế của Xiaomi 13 Pro năm nay có thể sẽ hơi khác biệt so với người đàn anh của mình, từ màu sắc\n                    cho đến cách sắp xếp camera thì hãng đều thay đổi để mang đến cho người dùng cái nhìn mới lạ, phong\n                    cách cũng được tăng thêm phần hiện đại nhằm bắt kịp với mọi xu hướng thiết kế hiện nay.\n                </p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-thiet-ke-2.jpg\" />\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Lưu giữ trọn vẹn mọi kỷ niệm</p>\n                <p style=\"font-size: 18px;\"> Lần ra mắt này Xiaomi 13 Pro kết hợp với nhà Leica, chính vì điều này đã\n                    làm háo hức cho những người hâm mộ dòng điện thoại Xiaomi và những ai yêu thích chụp ảnh trên điện\n                    thoại.</p>\n                <p style=\"font-size: 18px;\">Máy trang bị 3 camera có cùng độ phân giải 50 MP đi cùng với nhiều tính năng\n                    khá hiện đại giúp bạn có được những bức ảnh đẹp mà không cần phải chỉnh sửa quá nhiều.</p>\n\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-camera-2.jpg\" />\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Hiệu năng mạnh mẻ cân mọi tựa game</p>\n                <p style=\"font-size: 18px;\">Vi xử lý Snapdragon 8 Gen 2 sẽ được trang bị trên Xiaomi 13 Pro sở hữu hiệu\n                    năng mạnh mẽ vượt trội trong giới điện thoại Android nên đây là cái tên xứng tầm với flagship của\n                    nhà Xiaomi trong năm 2023. Giờ đây bạn có thể trải nghiệm mọi tựa game một cách mượt mà và xử lý mọi\n                    công việc nhanh chóng.</p>\n                <p style=\"font-size: 18px;\"> Lần ra mắt này Xiaomi trang bị cho điện thoại RAM 12 GB cùng khả năng mở\n                    rộng RAM hiện đại, các thao tác chuyển đổi qua lại giữa các tab hay mở nhiều ứng dụng cùng lúc không\n                    gặp hiện tượng giật lag.\n                </p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-100223-105843.jpg\" />\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Đầy pin chỉ trong chớp mắt</p>\n                <p style=\"font-size: 18px;\">Xiaomi 13 Pro được trang bị pin dung lượng lớn 4820 mAh, cho thời lượng sử\n                    dụng lên đến cả ngày với một lần sạc đầy. Sản phẩm cũng hỗ trợ sạc nhanh 120 W giúp tiết kiệm thời\n                    gian sạc trong cuộc sống đầy bận rộn.\n                </p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-sac-nhanh.jpeg\" />\n\n            </div>\n\n            <p style=\"font-size: 18px;\">\n                Cả Xiaomi 13 và Xiaomi 13 Pro đều được sản xuất với sự hợp tác của Leica để cải tiến phần camera và\n                thuật toán xử lý. Kết quả là, người dùng có thể tận hưởng nhiều tính năng chụp ảnh và bộ lọc màu đa dạng\n                hơn từ Leica. Điều này đặc biệt hữu ích đối với những người yêu thích nhiếp ảnh trên điện thoại và mong\n                muốn tạo ra các bức ảnh có chất lượng hoài cổ, thể hiện qua các bộ lọc màu độc đáo của Leica.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Chiếc điện thoại Xiaomi 13 Pro được trang bị 2 khe SIM nano, tuy nhiên sẽ không có khả năng mở rộng bộ\n                nhớ thông qua khe thẻ Micro SD. Vì thế, dung lượng bộ nhớ tối đa của thiết bị là 256 GB, con số đã được\n                hãng đưa ra sẵn trong sản phẩm.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Sự khác biệt về ngoại hình giữa Xiaomi 13 và Xiaomi 13 Pro là rất rõ ràng. Xiaomi 13 có thiết kế vuông\n                vắn, mặt lưng được làm bằng kính. Trong khi đó, Xiaomi 13 Pro có mặt lưng và màn hình được bo cong mềm\n                mại và được làm bằng chất liệu gốm cao cấp để mang đến cái nhìn hết sức thời thượng.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Xiaomi 13 Pro thực sự là một sản phẩm tốt và đáng để sở hữu. Với nhiều tính năng vượt trội hệ thống\n                camera chuyên nghiệp, chiếc điện thoại này sẽ là một lựa chọn tuyệt vời cho những người đang tìm kiếm\n                một thiết bị di động cao cấp.\n            </p>\n        </div>\n    </div>\n</body>', '2023-12-02 18:05:36'),
(3, NULL, 'Samsung Galazy Z Fold 5G', 'https://assets-prd.ignimgs.com/2021/08/11/samsung-galaxy-z-fold-3-5g-thumbnail-1-1628686974010.jpg', '<body>\n    <div style=\"width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;\">\n        <div style=\"width: 60%;\">\n\n\n            <div style=\"width: 100%; display: flex; justify-content: space-between;\">\n                <div style=\"width: 50%;\">\n                    <h1 style=\"font-size: 2x1;\">Điện thoại Xiaomi 13 Pro 5G mới được ra mắt</h1>\n\n                    <p style=\"font-size: 18px;\"> Điện thoại Xiaomi 13 Pro một cái tên đã xuất hiện tại thị trường Việt\n                        Nam vào cuối tháng 02/2023. Máy trang bị tấm nền AMOLED sắc nét cho hiển thị chi tiết, con chip\n                        Snapdragon 8 Gen 2 cho hiệu năng mạnh mẽ và khả năng chụp ảnh hết sức ấn tượng được hỗ trợ bởi\n                        Leica.\n                    </p>\n                </div>\n                <div style=\"width: 45%;\">\n                    <img style=\"border-radius: 15px;  width: 100%; height: 250px\"\n                        src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-man-hinh-2.jpg\" />\n\n                </div>\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Hiển thị sắc nét mọi hình ảnh với tấm nền AMOLED</p>\n                <p style=\"font-size: 18px;\">Lần ra mắt này hãng điện thoại Xiaomi sẽ trang bị cho Xiaomi 13 Pro tấm nền\n                    AMOLED với kích thước 6.73 inch. Xiaomi 13 Pro hứa hẹn không làm bạn thất vọng khi đem đến cho bạn\n                    trải nghiệm hình ảnh chất lượng nhất.\n\n                </p>\n                <p style=\"font-size: 18px;\">\n                    Đi cùng với đó hãng sẽ trang bị cho điện thoại độ phân giải 2K+ (1440 x 3200 pixels), cùng tần số\n                    quét 120 Hz giúp nâng cao khả năng hiển thị cũng như vuốt chạm diễn ra một cách mượt mà.\n                </p>\n                <p style=\"font-size: 18px;\">\n                    Thiết kế của Xiaomi 13 Pro năm nay có thể sẽ hơi khác biệt so với người đàn anh của mình, từ màu sắc\n                    cho đến cách sắp xếp camera thì hãng đều thay đổi để mang đến cho người dùng cái nhìn mới lạ, phong\n                    cách cũng được tăng thêm phần hiện đại nhằm bắt kịp với mọi xu hướng thiết kế hiện nay.\n                </p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-thiet-ke-2.jpg\" />\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Lưu giữ trọn vẹn mọi kỷ niệm</p>\n                <p style=\"font-size: 18px;\"> Lần ra mắt này Xiaomi 13 Pro kết hợp với nhà Leica, chính vì điều này đã\n                    làm háo hức cho những người hâm mộ dòng điện thoại Xiaomi và những ai yêu thích chụp ảnh trên điện\n                    thoại.</p>\n                <p style=\"font-size: 18px;\">Máy trang bị 3 camera có cùng độ phân giải 50 MP đi cùng với nhiều tính năng\n                    khá hiện đại giúp bạn có được những bức ảnh đẹp mà không cần phải chỉnh sửa quá nhiều.</p>\n\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-camera-2.jpg\" />\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Hiệu năng mạnh mẻ cân mọi tựa game</p>\n                <p style=\"font-size: 18px;\">Vi xử lý Snapdragon 8 Gen 2 sẽ được trang bị trên Xiaomi 13 Pro sở hữu hiệu\n                    năng mạnh mẽ vượt trội trong giới điện thoại Android nên đây là cái tên xứng tầm với flagship của\n                    nhà Xiaomi trong năm 2023. Giờ đây bạn có thể trải nghiệm mọi tựa game một cách mượt mà và xử lý mọi\n                    công việc nhanh chóng.</p>\n                <p style=\"font-size: 18px;\"> Lần ra mắt này Xiaomi trang bị cho điện thoại RAM 12 GB cùng khả năng mở\n                    rộng RAM hiện đại, các thao tác chuyển đổi qua lại giữa các tab hay mở nhiều ứng dụng cùng lúc không\n                    gặp hiện tượng giật lag.\n                </p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-100223-105843.jpg\" />\n\n            </div>\n            <div>\n                <p style=\"font-size: 23px; font-weight: bold; line-height: 20px;\">Đầy pin chỉ trong chớp mắt</p>\n                <p style=\"font-size: 18px;\">Xiaomi 13 Pro được trang bị pin dung lượng lớn 4820 mAh, cho thời lượng sử\n                    dụng lên đến cả ngày với một lần sạc đầy. Sản phẩm cũng hỗ trợ sạc nhanh 120 W giúp tiết kiệm thời\n                    gian sạc trong cuộc sống đầy bận rộn.\n                </p>\n            </div>\n            <div style=\"width: 100%; display: flex; justify-content: center;\">\n                <img style=\"border-radius: 15px;  width: 50%; height: 250px\"\n                    src=\"https://cdn.tgdd.vn/Products/Images/42/282903/xiaomi-13-pro-sac-nhanh.jpeg\" />\n\n            </div>\n\n            <p style=\"font-size: 18px;\">\n                Cả Xiaomi 13 và Xiaomi 13 Pro đều được sản xuất với sự hợp tác của Leica để cải tiến phần camera và\n                thuật toán xử lý. Kết quả là, người dùng có thể tận hưởng nhiều tính năng chụp ảnh và bộ lọc màu đa dạng\n                hơn từ Leica. Điều này đặc biệt hữu ích đối với những người yêu thích nhiếp ảnh trên điện thoại và mong\n                muốn tạo ra các bức ảnh có chất lượng hoài cổ, thể hiện qua các bộ lọc màu độc đáo của Leica.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Chiếc điện thoại Xiaomi 13 Pro được trang bị 2 khe SIM nano, tuy nhiên sẽ không có khả năng mở rộng bộ\n                nhớ thông qua khe thẻ Micro SD. Vì thế, dung lượng bộ nhớ tối đa của thiết bị là 256 GB, con số đã được\n                hãng đưa ra sẵn trong sản phẩm.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Sự khác biệt về ngoại hình giữa Xiaomi 13 và Xiaomi 13 Pro là rất rõ ràng. Xiaomi 13 có thiết kế vuông\n                vắn, mặt lưng được làm bằng kính. Trong khi đó, Xiaomi 13 Pro có mặt lưng và màn hình được bo cong mềm\n                mại và được làm bằng chất liệu gốm cao cấp để mang đến cái nhìn hết sức thời thượng.\n            </p>\n            <p style=\"font-size: 18px;\">\n                Xiaomi 13 Pro thực sự là một sản phẩm tốt và đáng để sở hữu. Với nhiều tính năng vượt trội hệ thống\n                camera chuyên nghiệp, chiếc điện thoại này sẽ là một lựa chọn tuyệt vời cho những người đang tìm kiếm\n                một thiết bị di động cao cấp.\n            </p>\n        </div>\n    </div>\n</body>', '2023-12-02 18:05:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `prodcatID` int(11) NOT NULL,
  `catName` varchar(50) NOT NULL,
  `catLogo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`prodcatID`, `catName`, `catLogo`) VALUES
(1, 'APPLE', ''),
(2, 'SAMSUNG', ''),
(3, 'OPPO', ''),
(4, 'XIAOMI', ''),
(5, 'HP', ''),
(6, 'ASUS', ''),
(7, 'LENOVO', ''),
(8, 'ACER', ''),
(9, 'RAPOO', ''),
(10, ' BASEUS', ''),
(11, 'LOGITEH', ''),
(12, 'MICROSOFT', ''),
(13, 'DAREU', ''),
(14, 'HYPERX', ''),
(15, 'XMOBILE', ''),
(16, 'RAZER', ''),
(17, 'AVA', ''),
(18, 'CORSAIR', ''),
(19, 'HYDRUS', ''),
(20, 'MSI', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `prodID` int(11) NOT NULL,
  `prodcatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `colorID` int(50) NOT NULL,
  `color` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`colorID`, `color`) VALUES
(1, 'Tím'),
(2, 'Đen'),
(3, 'Đỏ'),
(4, 'Trắng'),
(5, 'Xanh dương'),
(6, 'Tím'),
(7, 'Xanh lá'),
(8, 'Xanh ngọc bích'),
(9, 'Vàng đồng'),
(10, 'Bạc'),
(11, 'Tím nhạt'),
(12, 'Hồng'),
(13, 'Titan trắng'),
(14, 'Titan xanh'),
(15, 'Titan tự nhiên'),
(16, 'Titan đen'),
(17, 'Xanh Navy'),
(18, 'Cam'),
(19, 'Xám Xanh'),
(20, 'Xanh Lá Nhạt'),
(21, 'Hồng Đào'),
(22, 'Xanh Đen'),
(23, 'Trắng Xám'),
(24, 'Xanh Ngọc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `discountID` int(11) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `commentID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `prodRate` float NOT NULL,
  `userID` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `orderID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `colorID` int(11) DEFAULT NULL,
  `storageID` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `infoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`orderID`, `prodID`, `colorID`, `storageID`, `quantity`, `infoID`) VALUES
(6, 5, 6, 1, 1, 6),
(7, 45, 2, 1, 1, 6),
(8, 5, 6, 1, 1, 7),
(9, 8, NULL, NULL, 1, 8),
(10, 12, NULL, NULL, 2, 9),
(11, 48, 16, 2, 3, 9),
(12, 45, 2, 1, 1, 10),
(13, 12, NULL, NULL, 1, 11),
(14, 245, NULL, NULL, 1, 12),
(15, 192, NULL, NULL, 1, 13),
(16, 192, NULL, NULL, 1, 14),
(17, 192, NULL, NULL, 1, 15),
(18, 45, 2, 1, 1, 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_info`
--

CREATE TABLE `order_info` (
  `infoID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  `orderCode` varchar(200) NOT NULL,
  `payment` varchar(200) NOT NULL,
  `orderStatus` varchar(200) NOT NULL DEFAULT 'Đợi xác nhận',
  `totalPay` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentCode` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `order_info`
--

INSERT INTO `order_info` (`infoID`, `userID`, `addressID`, `orderCode`, `payment`, `orderStatus`, `totalPay`, `orderDate`, `paymentCode`) VALUES
(6, 58, 0, '060d7b70-52e5-11ef-81eb-3b3a647db29f', 'COD', 'Đã giao hàng', 38290000, '2024-08-05 04:41:47', NULL),
(7, 58, 0, '125babf0-52e9-11ef-81eb-3b3a647db29f', 'COD', 'Đợi xác nhận', 9900000, '2024-08-05 05:10:46', NULL),
(8, 58, 0, '12eb2420-547d-11ef-abfe-173a7fd8205b', 'COD', 'Đợi xác nhận', 24641500, '2024-08-07 05:22:43', NULL),
(9, 58, 0, '97658830-5482-11ef-abfe-173a7fd8205b', 'Banking', 'Đợi xác nhận', 100470000, '2024-08-07 06:02:13', NULL),
(10, 58, 0, 'c3f9e2b0-5482-11ef-abfe-173a7fd8205b', 'Banking', 'Đợi xác nhận', 28390000, '2024-08-07 06:03:28', NULL),
(11, 58, 0, '3bf67030-5483-11ef-abfe-173a7fd8205b', 'Banking', 'Đợi xác nhận', 21192000, '2024-08-07 06:06:49', NULL),
(12, 58, 0, 'b97fe3b0-5483-11ef-abfe-173a7fd8205b', 'Banking', 'Đợi xác nhận', 12990000, '2024-08-07 06:10:20', NULL),
(13, 58, 0, 'f9c71ec0-5483-11ef-abfe-173a7fd8205b', 'Banking', 'Đợi xác nhận', 10990000, '2024-08-07 06:12:07', NULL),
(14, 58, 0, '2ce56770-5485-11ef-abfe-173a7fd8205b', 'Banking', 'Đợi xác nhận', 10990000, '2024-08-07 06:20:43', NULL),
(15, 58, 0, 'cd616e00-5486-11ef-b2c1-e37d95894cd8', 'Banking', 'Đợi xác nhận', 10990000, '2024-08-07 06:32:21', NULL),
(16, 58, 0, 'cc9f12f0-5487-11ef-b6d6-6598055c49b3', 'Banking', 'Đợi xác nhận', 28390000, '2024-08-07 06:39:30', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `prodID` int(255) NOT NULL,
  `prodcatID` int(11) NOT NULL,
  `prodName` varchar(255) NOT NULL,
  `prodType` varchar(20) NOT NULL,
  `prodView` int(11) DEFAULT 0,
  `prodImg` text NOT NULL,
  `prodPrice` int(11) NOT NULL,
  `prodSale` int(11) NOT NULL DEFAULT 0,
  `prodDesc` text DEFAULT NULL,
  `QTY` int(11) NOT NULL DEFAULT 100,
  `prodRate` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`prodID`, `prodcatID`, `prodName`, `prodType`, `prodView`, `prodImg`, `prodPrice`, `prodSale`, `prodDesc`, `QTY`, `prodRate`) VALUES
(7, 5, 'HP Elitebook X360 1040 G9 i7 1255U (6Z982PA)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/302983/hp-elitebook-x360-1040-g9-i7-6z982pa-070323-112809-600x600.jpg', 40990000, 0, '', 100, 0),
(8, 5, 'HP Gaming VICTUS 16 r0128TX i5 13450HX', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313972/hp-gaming-victus-16-r0128tx-i5-8c5n3pa-thumb-1-600x600.jpg', 24641500, 15, '', 100, 0),
(9, 5, 'HP Gaming VICTUS 16 s0077AX R7 7840HS', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313974/hp-gaming-victus-16-s0077ax-r7-8c5n6pa-thumb-2-600x600.jpg', 28390000, 0, '', 100, 0),
(10, 5, 'HP EliteBook 840 G9 i5 1240P (6Z969PA)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/312987/hp-elitebook-840-g9-i5-6z969pa-thumb-600x600.jpg', 23366500, 15, '', 100, 0),
(11, 5, 'HP Envy X360 13 bf0090TU i7 1250U', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/296789/hp-envy-x360-13-bf0090tu-i7-76b13pa-101122-093057-600x600.jpg', 27190000, 0, '', 100, 0),
(12, 5, 'HP Gaming VICTUS 16 r0130TX i5 13500H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313973/hp-gaming-victus-16-r0130tx-i5-8c5n5pa-thumb-1-600x600.jpg', 21192000, 20, '', 100, 0),
(13, 5, 'HP Elitebook 630 G10 i7 1355U (873F2PA)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/315909/hp-elitebook-630-g10-i7-873f2pa-thumb-600x600.jpg', 25690000, 0, '', 100, 0),
(14, 5, 'HP Probook 450 G10 i7 1355U (873D3PA)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/315908/hp-probook-450-g10-i7-873d3pa-thumb-600x600.jpg', 24990000, 0, '', 100, 0),
(15, 5, 'HP Pavilion X360 14 ek1047TU i7 1355U', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/311115/hp-pavilion-x360-14-ek1047tu-i7-80r25pa-thumb-600x600.jpg', 24790000, 0, '', 100, 0),
(16, 5, 'HP Pavilion 15 eg3035TX i7 1355U (8U6L7PA)', 'Laptop', 0, 'https://phucanhcdn.com/media/product/38490_apple_iphone_se_2020_1.png', 10001, 0, '', 100, 0),
(17, 5, 'HP Pavilion X360 14 ek0132TU i7 1255U', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/303079/hp-pavilion-x360-14-ek0132tu-i7-7c0w4pa-thumb-600x600.jpg', 23390000, 0, '', 100, 0),
(18, 5, 'HP Gaming VICTUS 16 e1102AX R7 6800H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/302487/hp-victus-16-e1102ax-r7-7c139pa-thumb-laptop-600x600.jpg', 23990000, 0, '', 100, 0),
(19, 5, 'HP Envy X360 13 bf0112TU i5 1230U (7C0N9PA)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/309735/hp-envy-x360-13-bf0112tu-i5-7c0n9pa-glr-thumb-600x600.jpg', 21591000, 10, '', 100, 0),
(20, 5, 'HP Pavilion 15 eg3091TU i7 1355U (8C5L2PA)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/311177/hp-pavilion-15-eg3091tu-i7-8c5l2pa-thumb-600x600.jpg', 23190000, 0, '', 100, 0),
(21, 6, 'Asus TUF Gaming F15 FX506HF i5 11400H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/304867/asus-tuf-gaming-f15-fx506hf-i5-hn014w-thumb-600x600.jpg', 16990000, 0, '', 100, 0),
(22, 6, 'Asus Vivobook X515EA i3 1115G4 (EJ3948W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/305010/asus-vivobook-x515ea-i3-ej3948w-thumb-600x600.jpg', 9790000, 0, '', 100, 0),
(23, 6, 'Asus Vivobook 16 X1605VA i5 1335U (MB360W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/309375/asus-vivobook-16-x1605va-i5-mb360w-thumb-laptop-600x600.jpg', 15990000, 0, '', 100, 0),
(24, 6, 'Asus Vivobook X515EA i5 1135G7 (EJ4155W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313853/asus-vivobook-x515ea-i5-ej4155w-thumb-600x600.jpg', 13990000, 0, '', 100, 0),
(25, 6, 'Asus Vivobook Go 15 E1504FA R5 7520U', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/311178/asus-vivobook-go-15-e1504fa-r5-nj776w-thumb-600x600.jpg', 11466500, 15, '', 100, 0),
(26, 6, 'Asus Vivobook X415EA i3 1115G4 (EK2034W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/304866/asus-vivobook-x415ea-i3-ek2034w-thumb-laptop-600x600.jpg', 9190000, 0, '', 100, 0),
(27, 6, 'Asus Vivobook 15 X1504VA i5 1335U (NJ025W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/305008/asus-vivobook-15-x1504va-i5-nj025w-thumb-600x600.jpg', 15490000, 0, '', 100, 0),
(28, 6, 'Asus TUF Gaming F15 FX506HE i7 11800H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313251/asus-tuf-gaming-f15-fx506he-i7-hn378w-thumb-600x600.jpg', 20990000, 0, '', 100, 0),
(29, 6, 'Laptop Asus Vivobook 15 OLED A1505VA', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/310839/asus-vivobook-15-oled-a1505va-i5-l1341w-thumb-600x600.jpg', 18490000, 0, '', 100, 0),
(30, 6, 'Asus VivoBook X515MA N4020 (BR480W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/262060/asus-vivobook-x515ma-n4020-4gb-256gb-win11-br480w-251121-103455-600x600.jpg', 6490000, 0, '', 100, 0),
(31, 6, 'Asus Vivobook 15 X1504ZA i3 1215U (NJ102W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/312414/asus-vivobook-15-x1504za-i3-nj102w-thumb-600x600.jpg', 9341500, 15, '', 100, 0),
(32, 6, 'Asus Vivobook 15 OLED A1505ZA i5 12500H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/311180/asus-vivobook-15-oled-a1505za-i5-l1337w-thumb-1-600x600.jpg', 16990000, 0, '', 100, 0),
(33, 6, 'Asus Vivobook 15 X1504VA i7 1355U (NJ023W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/305009/asus-vivobook-15-x1504va-nj023w-thumb-600x600.jpg', 18990000, 0, '', 100, 0),
(34, 6, 'Asus Vivobook S 14 Flip TP3402VA i5 13500H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/304869/asus-vivobook-s-14-flip-tp3402va-i5-lz031w-thumb-1-600x600.jpg', 16566500, 15, '', 100, 0),
(35, 6, 'Asus TUF Gaming F15 FX506HC i5 11400H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/309373/asus-tuf-gaming-f15-fx506hc-i5-hn949w-thumb-600x600.jpg', 19990000, 0, '', 100, 0),
(36, 6, 'Asus Vivobook 14X OLED S3405VA i5 13500H (KM072W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/306197/asus-vivobook-14x-oled-s3405va-i5-km072w-thumb-600x600.jpg', 15992000, 20, '', 100, 0),
(37, 6, 'Asus TUF Gaming F15 FX507ZC4 i5 12500H (HN074W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/310803/asus-tuf-gaming-f15-fx507zc4-i5-hn074w-thumb-600x600.jpg', 19990000, 0, '', 100, 0),
(38, 6, 'Asus Vivobook 14 A1405VA i3 1315U (LY097W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/306104/asus-vivobook-14-a1405va-i3-ly097w-thumb-lap-600x600.jpg', 12290000, 0, '', 100, 0),
(39, 6, 'Asus TUF Gaming F17 FX706HF i5 11400H (HX390W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313850/asus-tuf-gaming-f17-fx706hf-i5-hx390w-thumb-600x600.jpg', 18990000, 0, '', 100, 0),
(40, 6, 'Asus Vivobook 15 OLED A1505VA i7 13700H (L1338W)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/311179/asus-vivobook-15-oled-a1505va-i7-l1338w-thumb-600x600.jpg', 21990000, 0, '', 100, 0),
(41, 7, 'Lenovo Ideapad 3 15ITL6 i5 1155G7 (82H803RRVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/309600/lenovo-ideapad-3-15itl6-i5-82h803rrvn-thumb-600x600.jpg', 11990000, 0, '', 100, 0),
(42, 7, 'Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/309721/lenovo-ideapad-3-15itl6-i3-82h803sgvn-thumb-600x600.jpg', 8990000, 0, '', 100, 0),
(44, 1, 'IPhone 15 Pro Max 256GB ', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-blue-thumbnew-600x600.jpg', 34990000, 0, '', 100, 0),
(45, 1, 'iPhone 15 Pro', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-blue-thumbnew-600x600.jpg', 23192000, 20, '', 100, 0),
(46, 1, 'iPhone 15 Plus', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/303823/iphone-15-plus-256gb-den-thumb-600x600.jpg', 28990000, 0, '', 100, 0),
(47, 1, 'iPhone 15', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-hong-thumb-1-600x600.jpg', 22990000, 0, '', 100, 0),
(48, 1, 'iPhone 14 Pro Max', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-tim-thumb-600x600.jpg', 26990000, 0, '', 100, 0),
(49, 1, 'iPhone 14 Pro', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-vang-thumb-600x600.jpg', 24990000, 0, '', 100, 0),
(51, 1, 'iPhone 14', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/240259/iPhone-14-thumb-tim-1-600x600.jpg', 19990000, 0, '', 100, 0),
(52, 1, 'iPhone 13', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-pink-2-600x600.jpg', 17990000, 0, '', 100, 0),
(53, 1, 'iPhone 12', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-la-new-2-600x600.jpg', 13990000, 0, '', 100, 0),
(55, 2, 'Samsung Galaxy A05', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/313199/samsung-galaxy-a05-thumb-600x600.jpg', 3192000, 20, '', 100, 0),
(56, 2, 'Samsung Galaxy S23 FE 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/306994/samsung-galaxy-s23-fe-xanh-thumb-600x600.jpg', 14391000, 10, '', 100, 0),
(57, 2, 'Samsung Galaxy Z Fold5 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-%20kem-600x600.jpg', 36990000, 0, '', 100, 0),
(58, 2, 'Samsung Galaxy Z Fold4 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold4-kem-256gb-600x600.jpg', 22990000, 0, '', 100, 0),
(59, 2, 'Samsung Galaxy S23 Ultra 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-thumb-xanh-600x600.jpg', 22990000, 0, '', 100, 0),
(60, 2, 'Samsung Galaxy Z Flip5 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-xanh-mint-thumb-600x600.jpg', 17592000, 20, '', 100, 0),
(61, 2, 'Samsung Galaxy S23+ 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-600x600.jpg', 17841500, 15, '', 100, 0),
(62, 2, 'Samsung Galaxy S22 Ultra 5G 128GB', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/235838/Galaxy-S22-Ultra-Burgundy-600x600.jpg', 17990000, 0, '', 100, 0),
(63, 2, 'Samsung Galaxy S23 5G 128GB', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/264060/samsung-galaxy-s23-600x600.jpg', 13592000, 20, '', 100, 0),
(64, 2, 'Samsung Galaxy Z Flip4 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/258047/samsung-galaxy-z-flip4-5g-128gb-thumb-tim-600x600.jpg', 13990000, 0, '', 100, 0),
(65, 2, 'Samsung Galaxy S21 FE 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/267211/Samsung-Galaxy-S21-FE-vang-1-2-600x600.jpg', 10990000, 0, '', 100, 0),
(66, 2, 'Samsung Galaxy A54 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/303585/samsung-galaxy-a54-thumb-tim-600x600.jpg', 9990000, 0, '', 100, 0),
(67, 2, 'Samsung Galaxy M34 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/309834/samsung-galaxy-m34-xanh-ngoc-thumb-600x600.jpg', 8990000, 0, '', 100, 0),
(68, 2, 'Samsung Galaxy A34 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/303583/samsung-galaxy-a34-thumb-den-600x600.jpg', 7990000, 0, '', 100, 0),
(69, 2, 'Samsung Galaxy A53 5G 128GB', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/246196/Samsung-Galaxy-A53-xanh-thumb-600x600.jpg', 7990000, 0, '', 100, 0),
(70, 2, 'Samsung Galaxy A24', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-black-thumb-600x600.jpg', 6990000, 0, '', 100, 0),
(71, 2, 'Samsung Galaxy A14 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/271721/samsung-galaxy-a14-5g-thumb-nau-600x600.jpg', 4990000, 0, '', 100, 0),
(72, 2, 'Samsung Galaxy A14 4G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/292770/samsung-galaxy-a14-tlte-thumb-den-600x600.jpg', 4990000, 0, '', 100, 0),
(73, 2, 'Samsung Galaxy A05s', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/313202/samsung-galaxy-a05s-den-thumb-1-1-600x600.jpg', 4990000, 0, '', 100, 0),
(74, 2, 'Samsung Galaxy A04s', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/283819/samsung-galaxy-a04s-thumb-den-600x600.jpg', 3990000, 0, '', 100, 0),
(75, 2, 'Samsung Galaxy A04', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/275434/samsung-galaxy-a04-thumb-den-1-600x600.jpg', 2990000, 0, '', 100, 0),
(76, 3, 'OPPO Reno10 Pro 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/306979/oppo-reno10-pro-grey-thumbnew-600x600.jpg', 14990000, 0, '', 100, 0),
(77, 3, 'OPPO A57 128GB', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/285082/oppo-a57-xanh-thumb-1-600x600.jpeg', 4990000, 0, '', 100, 0),
(78, 3, 'OPPO Find N2 Flip 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/299034/oppo-n2-flip-den-thumb-600x600.jpg', 19990000, 0, '', 100, 0),
(79, 3, 'OPPO Reno10 Pro+ 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/306980/oppo-reno10-pro-plus-thumbnew-600x600.jpg', 18990000, 0, '', 100, 0),
(80, 3, 'OPPO Find X5 Pro 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/250622/oppo-find-x5-pro-trang-thumb-1-600x600.jpg', 17990000, 0, '', 100, 0),
(81, 3, 'OPPO Reno8 Pro 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/260546/oppo-reno8-pro-thumb-den-600x600.jpg', 12591000, 10, '', 100, 0),
(82, 3, 'OPPO Reno10 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/309722/oppo-reno10-blue-thumbnew-600x600.jpg', 9990000, 0, '', 100, 0),
(83, 3, 'OPPO Reno8 T 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/301642/oppo-reno8t-vang1-thumb-600x600.jpg', 8490000, 0, '', 100, 0),
(84, 3, 'OPPO A98 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/307891/oppo-a98-5g-xanh-thumb-1-2-600x600.jpg', 8490000, 0, '', 100, 0),
(85, 3, 'OPPO Reno8 T', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/299248/oppo-reno8t-4g-den1-thumb-600x600.jpg', 7490000, 0, '', 100, 0),
(86, 3, 'OPPO A78', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/309847/oppo-a78-xanh-thumb-1-600x600.jpg', 6490000, 0, '', 100, 0),
(87, 3, 'OPPO Reno7 series', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/271717/oppo-reno7-z-5g-thumb-2-1-600x600.jpg', 5990000, 0, '', 100, 0),
(88, 3, 'OPPO A58', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/311354/oppo-a58-4g-green-thumb-600x600.jpg', 5690000, 0, '', 100, 0),
(89, 3, 'OPPO A77s', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/292780/oppo-a77s-den-thumb-1-2-600x600.jpg', 5090000, 0, '', 100, 0),
(90, 3, 'OPPO A38', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/313154/oppo-a38-gold-thumb-600x600.jpg', 3352000, 20, '', 100, 0),
(91, 3, 'OPPO A17', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/288401/oppo-a17-den-thumb-600x600.jpg', 3490000, 0, '', 100, 0),
(92, 3, 'OPPO A17K', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/288404/oppo-a17k-vang-thumb-%C4%83-600x600.jpg', 2890000, 0, '', 100, 0),
(93, 4, 'Xiaomi Redmi 12', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-bac-thumb-600x600.jpg', 3096000, 10, '', 100, 0),
(94, 4, 'Xiaomi 13T 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/315401/xiaomi-13t-xanh-thumb-600x600.jpg', 11990000, 0, '', 100, 0),
(95, 4, 'Xiaomi 13T Pro 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/309816/xiaomi-13-t-den-thumb-1-600x600.jpg', 14990000, 0, '', 100, 0),
(96, 4, 'Xiaomi Redmi Note 12 4G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/309846/xiaomi-redmi-note-12-vang-1-thumb-momo-600x600.jpg', 5490000, 0, '', 100, 0),
(97, 4, 'Xiaomi Redmi Note 12 Pro', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/299734/xiaomi-redmi-12-pro-4g-xanh-thumb-600x600.jpg', 6590000, 0, '', 100, 0),
(98, 4, 'Xiaomi Redmi 12C', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/303575/xiaomi-redmi-12c-grey-thumb-600x600.jpg', 2590000, 0, '', 100, 0),
(99, 4, 'Xiaomi 13 Lite 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/302531/xiaomi-13-lite-xanh-thumb-1-600x600.jpg', 8990000, 0, '', 100, 0),
(100, 4, 'Xiaomi 12 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/234621/Xiaomi-12-xam-thumb-mau-600x600.jpg', 9341500, 15, '', 100, 0),
(101, 4, 'Xiaomi Redmi Note 12 Pro 5G', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/278886/xiaomi-redmi-note-12-pro-5g-momo-1-600x600.jpg', 8790000, 0, '', 100, 0),
(102, 4, 'Xiaomi Redmi Note 12S', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/273335/xiaomi-redmi-note12s-den-thumb-600x600.jpg', 5890000, 0, '', 100, 0),
(103, 1, 'iPad 9 WiFi', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/247517/iPad-9-wifi-trang-600x600.jpg', 6741000, 10, '', 100, 0),
(104, 1, 'iPad Air 5 M1 WiFi 64GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/248096/ipad-air-5-wifi-grey-thumb-600x600.jpg', 14590000, 0, '', 100, 0),
(105, 1, 'iPad 10 WiFi 64GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/294103/iPad-gen-10-1-600x600.jpg', 11390000, 0, '', 100, 0),
(106, 1, 'iPad Pro M2 11 inch WiFi Cellular 128GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/295458/ipad-pro-m2-11-inch-wifi-5g-xam-thumb-600x600.jpg', 24090000, 0, '', 100, 0),
(107, 1, 'iPad Pro M2 11 inch WiFi', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/294104/ipad-pro-m2-11-wifi-xam-thumb-600x600.jpg', 20690000, 0, '', 100, 0),
(108, 1, 'iPad Air 5 M1 WiFi Cellular 64GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-wifi-cellular-tim-thumb-600x600.jpg', 15291500, 15, '', 100, 0),
(109, 1, 'iPad mini 6 WiFi Cellular 64GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/250734/ipad-mini-6-wifi-cellular-grey-1-600x600.jpg', 15990000, 0, '', 100, 0),
(110, 1, 'iPad 10 WiFi Cellular 64GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/295453/ipad-10-wifi-cellular-pink-thumb-600x600.jpeg', 14390000, 0, '', 100, 0),
(111, 1, 'iPad 9 4G', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/250731/iPad-9-5G-trang-600x600.jpg', 11290000, 0, '', 100, 0),
(112, 2, 'Samsung Galaxy Tab A8 (2022)', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/251704/samsung-galaxy-tab-a8-thumb-1-600x600.jpg', 5301000, 10, '', 100, 0),
(113, 2, 'Samsung Galaxy Tab A7 Lite', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-gray-600x600.jpg', 3590000, 0, '', 100, 0),
(114, 2, 'Samsung Galaxy Tab S7 FE 4G', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/240254/samsung-galaxy-tab-s7-fe-green-600x600.jpg', 9790000, 0, '', 100, 0),
(115, 2, 'Samsung Galaxy Tab S9 Ultra 5G (12GB/512GB)', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/311075/samsung-galaxy-tab-s9-ultra-kem-thumb-600x600.jpg', 32990000, 0, '', 100, 0),
(116, 2, 'Samsung Galaxy Tab S9+ 5G', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/311074/samsung-galaxy-tab-s9-plus-xam-thumb-600x600.jpg', 26990000, 0, '', 100, 0),
(117, 2, 'Samsung Galaxy Tab S9+ WiFi', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-kem-thumb-600x600.jpg', 23990000, 0, '', 100, 0),
(118, 2, 'Samsung Galaxy Tab S9 5G', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/311062/samsung-galaxy-tab-s9-kem-thumb-600x600.jpg', 20990000, 0, '', 100, 0),
(119, 2, 'Samsung Galaxy Tab S9 WiFi', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/303299/samsung-galaxy-tab-s9-kem-thumb-600x600.jpg', 17990000, 0, '', 100, 0),
(120, 4, 'Xiaomi Pad 6', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/309848/xiaomi-pad-6-blue-thumb-600x600.jpg', 8811000, 10, '', 100, 0),
(121, 4, 'Xiaomi Redmi Pad (4GB/128GB)', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/291769/Redmi-Pad-Sliver-thumb-org-1-2-600x600.jpg', 5990000, 0, '', 100, 0),
(122, 4, 'Xiaomi Redmi Pad SE 6GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-pad-se-xanh-thumb-600x600.jpg', 4990000, 0, '', 100, 0),
(123, 4, 'Xiaomi Redmi Pad SE 4GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/315607/xiaomi-pad-se-xanh-thumb-600x600.jpg', 3592000, 20, '', 100, 0),
(124, 4, 'Xiaomi Redmi Pad (3GB/64GB)', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/281633/Redmi-Pad-Sliver-thumb-org-600x600.jpg', 4090000, 0, '', 100, 0),
(125, 3, 'OPPO Pad Air 128GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-thumbnew-600x600.jpeg', 6196500, 15, '', 100, 0),
(126, 3, 'OPPO Pad Air 64GB', 'Tablet', 0, 'https://cdn.tgdd.vn/Products/Images/522/281821/OPPO-pad-thumb-x%C3%A1m-600x600.jpg', 5990000, 0, '', 100, 0),
(129, 7, 'Lenovo Ideapad Slim 3 15IAH8 i5 12450H (83ER000EVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-thumb-600x600.jpg', 14990000, 0, '', 100, 0),
(130, 0, 'Lenovo IdeaPad 1 15AMN7 R5 7520U (82VG0061VN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/303562/lenovo-ideapad-1-15amn7-r5-82vg0061vn-thumb-laptop-1-600x600.jpg', 10990000, 0, '', 100, 0),
(131, 7, 'HSSV Giảm 700k HSSV GIẢM 700K Lenovo IdeaPad 3 15ITL6 i7 1165G7 (82H803CUVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/306277/lenovo-ideapad-3-15itl6-i7-82h803cuvn-thumb-600x600.jpg', 13990000, 0, '', 100, 0),
(132, 7, 'Lenovo IdeaPad Slim 5 Light 14ABR8 R5 7530U', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/305673/lenovo-ideapad-slim-5-light-14abr8-r5-82xs002kvn-thumb-600x600.jpg', 16990000, 0, '', 100, 0),
(133, 7, 'Lenovo Ideapad Slim 3 15IAH8 i5 12450H (83ER000FVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313582/lenovo-ideapad-slim-3-15iah8-i5-83er000fvn-thumb-600x600.jpg', 15990000, 0, '', 100, 0),
(134, 7, 'Lenovo V14 G3 IAP i5 1235U (82TS005RVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/299801/lenovo-v14-g3-iap-i5-82ts005rvn-thumb-600x600.jpg', 10290000, 0, '', 100, 0),
(135, 7, 'Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SFVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/309724/lenovo-ideapad-3-15itl6-i3-82h803sfvn-thumb-600x600.jpg', 7032000, 20, '', 100, 0),
(136, 7, 'Lenovo LOQ Gaming 15IRH8 i7 13620H (82XV00QXVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313613/lenovo-loq-gaming-15irh8-i7-82xv00qxvn-thumb-600x600.jpg', 30990000, 0, '', 100, 0),
(137, 7, 'Lenovo Ideapad 1 15ALC7 R7 5700U (82R400C1VN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313627/lenovo-ideapad-1-15alc7-r7-82r400c1vn-thumb-600x600.jpg', 13290000, 0, '', 100, 0),
(138, 7, 'Lenovo Yoga 7 14IRL8 i7 1360P (82YL006BVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313619/lenovo-yoga-7-14irl8-i7-82yl006bvn-thumb-600x600.jpg', 27990000, 0, '', 100, 0),
(139, 7, 'Lenovo Ideapad 5 14IAL7 i5 1235U (82SD0060VN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/287771/lenovo-ideapad-5-14ial7-i5-82sd0060vn-171222-040323-600x600.jpg', 13790000, 0, '', 100, 0),
(140, 7, 'Lenovo Ideapad 3 15IAU7 i3 1215U (82RK005LVN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/287769/lenovo-ideapad-3-15iau7-i3-82rk005lvn-281122-051953-600x600.jpg', 9290000, 0, '', 100, 0),
(141, 7, 'Lenovo LOQ Gaming 15IRH8 i5 13420H (82XV00Q4VN)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313611/lenovo-loq-gaming-15irh8-i5-82xv00q4vn-thumb-600x600.jpg', 27990000, 0, '', 100, 0),
(142, 8, 'Acer Aspire 3 A315 58 589K i5 1135G7 (NX.AM0SV.008)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/305600/acer-aspire-3-a315-58-589k-i5-nxam0sv008-thumb-600x600.jpg', 10990000, 0, '', 100, 0),
(143, 8, 'Acer Aspire 5 Gaming A515 58GM 51LB i5 13420H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/314630/acer-aspire-5-a515-58gm-51lb-i5-nxkq4sv002-170923-015941-600x600.jpg', 16990000, 0, '', 100, 0),
(144, 8, 'Acer Aspire 3 A315 510P 32EF i3 N305 (NX.KDHSV.001)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/310282/acer-aspire-3-a315-510p-32ef-i3-nxkdhsv001-thumb-600x600.jpg', 8990000, 0, '', 100, 0),
(145, 8, 'Acer Aspire 3 A314 35 C3KS N5100 (NX.A7SSV.009)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/308490/acer-aspire-3-a314-35-c3ks-n5100-nxa7ssv009-thumb-600x600.jpg', 5690000, 0, '', 100, 0),
(146, 8, 'Acer Aspire 3 A315 59 314F i3 1215U (NX.K6TSV.002)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/286228/acer-aspire-3-a315-59-314f-i3-nxk6tsv002-thumb-1-600x600.jpg', 8690000, 0, '', 100, 0),
(147, 8, 'Acer Nitro 5 Gaming AN515 57 5669 i5 11400H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/263983/acer-nitro-5-gaming-an515-57-5669-i5-11400h-8gb-512gb-144hz-4gb-gtx1650-win11-nhqehsv001-031221-100506-600x600.jpg', 17490000, 0, '', 100, 0),
(148, 8, 'Acer Aspire 3 A315 57 379K i3 1005G1 (NX.KAGSV.001)', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/291965/acer-aspire-3-a315-57-379k-i3-nxkagsv001-ab-thumb-600x600.jpg', 5661000, 10, '', 100, 0),
(149, 8, 'Acer Aspire 7 Gaming A715 76G 5132 i5 12450H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/307786/acer-aspire-7-gaming-a715-76g-5132-i5-nhqmesv002-thumb-600x600.jpg', 13131000, 10, '', 100, 0),
(150, 8, 'Acer Gaming Nitro 5 AN515 58 769J i7 12700H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/313332/acer-nitro-5-an515-58-769j-i7-nhqfhsv003-thumb-600x600.jpg', 24990000, 0, '', 100, 0),
(151, 8, 'Acer Aspire 7 Gaming A715 43G R8GA R5 5625U', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/285961/acer-aspire-7-gaming-a715-43g-r8ga-r5-nhqhdsv002-thumb-600x600.jpg', 16490000, 0, '', 100, 0),
(152, 8, 'Acer Gaming Nitro 5 AN515 57 53F9 i5 11400H', 'Laptop', 0, 'https://cdn.tgdd.vn/Products/Images/44/308489/acer-gaming-nitro-5-an515-57-53f9-i5-nhqensv008-thumb-600x600.jpg', 18190000, 0, '', 100, 0),
(153, 1, 'iPhone 15 Pro Max', 'Phone', 0, 'https://cdn.tgdd.vn/Products/Images/42/305660/iphone-15-pro-max-blue-thumbnew-600x600.jpg', 46490000, 1, 'Diện mạo sang trọng, cứng cáp\niPhone 15 Pro Max 1 TB vẫn duy trì thiết kế vuông vắn và đẳng cấp đã làm nên tên tuổi của dòng sản phẩm này. Việc giữ nguyên dáng vẻ truyền thống không chỉ thể hiện sự sang trọng, thanh lịch mà còn giúp người dùng nhận ra ngay lập tức rằng đây là một chiếc iPhone.\n \nLà một sự thay đổi quan trọng, iPhone 15 Pro Max 1 TB đã từ bỏ chất liệu khung thép không gỉ quen thuộc để chuyển sang sử dụng khung Titanium. Điều này không chỉ làm cho chiếc điện thoại trở nên cứng cáp hơn mà còn giúp giảm khối lượng tổng thể, mang lại sự thoải mái hơn khi sử dụng trong thời gian dài.\n\n', 99, 0),
(156, 1, 'Tai nghe Bluetooth AirPods Pro Gen 2 MagSafe Charge (USB-C) Apple MTJV3', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/315014/tai-nghe-bluetooth-airpods-pro-2nd-gen-usb-c-charge-apple-1.jpg', 6200000, 5, 'Tai nghe Bluetooth AirPods Pro (2nd Gen) được Apple trình làng vào tháng 09/2023 với nhiều sự mong đợi, Apple vẫn giữ nguyên thiết kế AirPods Pro Gen 2 giống với phiên bản tiền nhiệm của mình như: kích thước nhỏ gọn, đường bo góc tinh tế, gam màu trắng sang trọng.\r\n\r\nTuy nhiên trong lần ra mắt này, Apple đã thay mới cổng sạc cho các thiết bị của mình, tương tự như cổng sạc trên các mẫu iPhone 15 series, AirPods Pro Gen 2 được tích hợp cổng sạc Type-C nhằm tối ưu phụ kiện sạc giữa các thiết bị.', 100, 1),
(157, 4, 'Tai nghe Bluetooth True Wireless AVA+ Buds Life Air 2', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/310764/tai-nghe-bluetooth-true-wireless-ava-buds-life-air-2-7.jpg', 490000, 10, 'Diện mạo tai nghe sang trọng, chất liệu nhựa cao cấp tạo cảm giác cứng cáp, bảo vệ tai nghe tốt, yên tâm mỗi khi sử dụng.', 100, 1),
(158, 1, 'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/310763/tai-nghe-bluetooth-true-wireless-ava-freego-a20-2-1.jpg', 290000, 0, 'Tai nghe trang bị chất âm sống động, mạnh mẽ, mang đến những trải nghiệm nghe nhạc tối ưu.', 100, 1),
(159, 4, 'Tai nghe Bluetooth True Wireless AVA+ FreeGo W26', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/310172/tai-nghe-bluetooth-true-wireless-ava-freego-w26-2.jpg', 310000, 12, ' Kiểu dáng tai nghe thanh lịch, thiết kế hộp sạc 4 bo góc mềm mại, kích thước vừa lòng bàn tay, dễ dàng mang theo bất cứ đâu.', 100, 1),
(160, 1, 'Tai nghe Bluetooth True Wireless SOUL S-LIVE 30', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/315176/tai-nghe-bluetooth-true-wireless-soul-s-live-30-1-2.jpg', 690000, 43, 'SOUL S-LIVE 30 sở hữu kiểu dáng nhỏ gọn, hiện đại và phù hợp để bỏ vào túi quần, túi áo khoác hay các loại túi xách, túi đeo có kích thước nhỏ,... Ngoài ra, tai nghe còn có tính năng kháng nước chuẩn IPX4, để bạn yên tâm hơn khi sử dụng trong lúc luyện tập thể ', 100, 1),
(161, 8, 'Tai nghe Bluetooth True Wireless AVA+ Buds Life Rider GT07', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/311315/tai-nghe-bluetooth-true-wireless-ava-buds-life-rider-gt07-trang-5-1.jpg', 550000, 10, 'Diện mạo tai nghe đẹp mắt, thiết kế mạnh mẽ, phù hợp với nhiều phong cách người dùng.', 100, 1),
(162, 1, 'Tai nghe Bluetooth True Wireless OPPO ENCO Buds 2 ETE41', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/287888/tai-nghe-bluetooth-tws-oppo-enco-buds-2-ete41-trang-1.jpg', 990000, 20, 'Phần hộp đựng của tai nghe Bluetooth True Wireless OPPO ENCO Buds 2 ETE41 mang kiểu dáng thiết kế dạng tròn trông khá lạ mắt với khối lượng gọn nhẹ. Nắp hộp có thể đóng, mở dễ dàng cùng phần bản lề vô cùng chắc chắn. Sở hữu bề mặt bóng bao bọc trọn vẹn hộp đựng giúp tai nghe thêm phần thời thượng, sang chảnh, phù hợp với mọi đối tượng.', 100, 1),
(163, 4, 'Tai nghe Bluetooth True Wireless HAVIT TW945', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/310762/tai-nghe-bluetooth-true-wireless-havit-tw945-cam-9.jpg', 450000, 28, 'Thiết kế trong suốt trẻ trung và đột phá, trang bị nhiều gam màu thời thượng cho bạn dễ dàng lựa chọn.', 100, 1),
(164, 2, 'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds 2 Pro R510N', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/286046/tai-nghe-bluetooth-true-wireless-galaxy-buds2-pro-1.jpg', 4990000, 25, 'Tháng 08/2022, nhà Samsung cho ra mắt sản phẩm mới là tai nghe Bluetooth True Wireless Samsung Galaxy Buds 2 Pro R510N. Đây là phiên bản kế nhiệm của chiếc tai nghe Samsung Galaxy Buds Pro (ra mắt vào tháng 01/2021). Sản phẩm mới này hứa hẹn sẽ bổ sung nhiều tính năng hấp dẫn cho người dùng.', 100, 1),
(165, 4, 'Tai nghe Bluetooth TWS Xiaomi Redmi Buds 4 Lite ', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/304652/tai-nghe-bluetooth-tws-xiaomi-redmi-buds-4-lite-den-6.jpg', 790000, 31, 'Thiết kế đẹp mắt, màu sắc thời thượng\r\nThiết kế gọn gàng, các cạnh góc được bo cong mềm mại giúp cảm giác cầm nắm êm tay, đồng thời tạo nên một tổng thể sang trọng, thu hút. Cách thiết kế nắp đóng mở hộp sạc độc đáo tạo mang đến một thiết kế hơi hướng tàu vũ trụ không gian mới lạ, nam châm ', 100, 1),
(166, 4, 'Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 4 Active ', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/310796/tai-nghe-bluetooth-true-wireless-xiaomi-redmi-buds-4-active-4-1.jpg', 700000, 36, 'Diện mạo đẹp mắt, hộp sạc vừa vặn tay cầm, có thể mang theo bất cứ đâu mà không lo chiếm diện tích.', 100, 1),
(167, 1, 'Tai nghe Bluetooth Soundpeats Opera 03', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/310363/tai-nghe-bluetooth-soundpeats-opera-03-3-2.jpg', 1790000, 30, ' Kiểu dáng tai nghe độc đáo, tương tự các mẫu tai nghe idol Hàn Quốc sử dụng, củ tai thiết kế dạng In-ear giúp ôm trọn khuôn tai.', 100, 1),
(168, 4, 'Tai nghe Bluetooth True Wireless Rezo Air ', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/302991/tai-nghe-bluetooth-tws-rezo-air-trang-2.jpeg', 890000, 40, 'Hộp sạc được thiết kế đặc biệt với các phiên bản màu sắc thời thượng, toàn bộ thiết kế bên ngoài phủ một lớp nhựa trong suốt tạo hiệu ứng bóng bẩy, làm nổi bật tai nghe bên trong và màu sắc vốn có của hộp sạc.', 100, 1),
(169, 1, 'Tai nghe Bluetooth True Wireless Baseus AirNora 2', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/310258/tai-nghe-bluetooth-true-wireless-baseus-airnora-2-4.jpg', 1400000, 25, 'Thiết kế tai nghe theo phong cách hiện đại, màu sắc thanh lịch, phù hợp cả nam lẫn nữ.', 100, 1),
(170, 1, 'Tai nghe Bluetooth AirPods 3 Lightning Charge Apple MPNY3', 'EarPhone', 0, 'https://cdn.tgdd.vn/Products/Images/54/290053/tai-nghe-bluetooth-airpods-3-lightning-charge-apple-mpny3-trang-1.jpg', 4490000, 10, 'Thiết kế tai nghe nhỏ gọn với màu trắng sang trọng vốn quen thuộc trên các dòng tai nghe Apple. Dạng tai nghe Earbuds cho cảm giác thoải mái khi đeo.', 100, 1),
(171, 2, 'Loa Bluetooth Rezo Pulse E20', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/310683/loa-bluetooth-rezo-pulse-e20-2-3.jpg', 1050000, 5, 'Loa được làm từ chất liệu nhựa kết hợp màng vải bọc mang đến sự bền bỉ và vẻ ngoài sang trọng.', 100, 1),
(172, 5, 'Loa Bluetooth Rezo Home Series One', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/309509/loa-bluetooth-rezo-home-series-one-8-3.jpg', 940000, 40, 'Loa Bluetooth Rezo Home Series One sở hữu thiết kế độc đáo, nổi bật với đèn LED đa sắc, âm thanh 360 độ sống động, thời lượng pin lớn, mang đến cho bạn những buổi tiệc âm nhạc bất tận.\r\n• Loa được làm từ chất liệu nhựa kết hợp màng vải bọc mang đến vẻ ngoài sang trọng và bền bỉ.', 100, 1),
(173, 1, 'Loa Bluetooth JBL Flip 6 ', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/304567/bluetooth-jbl-flip-6-3.jpg', 2990000, 15, 'Loa Bluetooth JBL Flip 6 sở hữu kiểu dáng đậm chất năng động, gam màu trắng thanh lịch, kết nối ổn định, âm thanh mạnh mẽ với công suất lớn, thời lượng sử dụng lớn, mang đến cho bạn những buổi tiệc bùng cháy.\r\n• Diện mạo loa Bluetooth trẻ trung, kích thước nhỏ gọn chỉ tương đương với chiếc điện thoại iPhone 13 Pro Max. Trang bị dây đeo chắc chắn cho phép bạn có thể xách theo bất cứ đâu.', 100, 1),
(174, 4, 'Loa Bluetooth Monster Sparkle', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/304547/loa-bluetooth-monster-sparkle-2-1.jpg', 2690000, 20, 'Loa Bluetooth Monster Sparkle với hệ thống đèn LED nổi bật cùng thiết kế thuôn dài đẹp mắt, công nghệ âm thanh sống động, tốc độ kết nối nhanh chóng, tiện lợi sử dụng trong những bữa tiệc cá nhân và các buổi tụ họp bạn bè hàng ngày.', 100, 1),
(175, 4, 'Loa Bluetooth Monster Adventurer MAX ', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/302688/loa-bluetooth-monster-adventurer-max-2-1.jpg', 4950000, 35, 'Loa Bluetooth Monster Adventurer MAX sở hữu thiết kế thời trang, năng động, màu sắc sang trọng dễ dàng phối với mọi không gian kết hợp cùng âm thanh cuốn hút, hứa hẹn đem đến trải nghiệm giai điệu âm nhạc với chất âm ấn tượng, chinh phục người dùng. ', 100, 1),
(176, 4, 'Loa Bluetooth Monster Superstar S320', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/302671/loa-bluetooth-monster-superstar-s320-2-1.jpg', 1990000, 12, 'Loa Bluetooth Monster Superstar S320 được hãng Monster sản xuất có công suất lớn, âm thanh nổi 360 độ cùng thời lượng pin dài cho bạn trải nghiệm âm nhạc ấn tượng ngay cả khi ở nhà hay hoạt động ngoài trời.\r\n• Loa Monster là thương hiệu đến từ Mỹ với kinh nghiệm sản xuất nhiều năm để mang lại trải nghiệm âm nhạc ấn tượng nhất trên sản phẩm loa Superstar với công suất 40 W kết hợp âm thanh nổi 360 độ giúp bạn được thưởng thức âm thanh vòm như rạp chiếu ', 100, 1),
(177, 1, 'Loa Bluetooth Sony SRS-XB100', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/312682/loa-bluetooth-sony-srs-xb100-den-1.jpg', 1499000, 16, 'Loa Bluetooth Sony SRS-XB100 sở hữu kích thước nhỏ gọn, âm thanh mạnh mẽ và sắc nét, thời lượng pin sử dụng lâu dài, nhiều gam màu dễ dàng lựa chọn, mang đến không gian âm nhạc hoàn hảo trong phòng hay tiện lợi đem theo mở tiệc cùng bạn bè.\r\n• Trang bị màng loa lệch tâm và kiểu thiết kế cân bằng khối lượng giúp âm thanh trong trẻo và rõ nét ngay ở âm lượng cao.', 100, 1),
(178, 1, 'Loa Bluetooth Mozard X21', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/247516/bluetooth-mozard-x21-2-1.jpeg', 550000, 45, 'Thiết kế gọn đẹp, bề mặt phủ sắc đen thời thượng, đính kèm dây treo tiện di chuyển\r\nLoa Bluetooth Mozard X21 có dạng hình tròn, chi tiết tinh tế cho cảm giác sang trọng, cao cấp. Tích hợp dây treo đồng màu cho phép bạn treo móc, mang theo tiện lợi khi đi du lịch, công tác hoặc đơn giản là di chuyển giữa các phòng trong nhà.', 100, 1),
(179, 2, 'Loa Bluetooth Samsung SRS-XB13', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/249767/bluetooth-sony-srs-xb13-3-1-org.jpg', 1290000, 28, 'Kiểu dáng di động, 2 tông màu đen - xanh dương cá tính\r\nThiết kế loa Bluetooth Sony đơn giản, gọn nhẹ chỉ 0.34 kg, đi kèm dây treo cho bạn dễ dàng đeo vào cổ tay của mình hoặc treo móc vào balo mang theo khi đi chơi, du lịch, đi học,... Chất liệu vỏ nhựa có thêm lớp UV coating cho độ bền cao, chống trầy xước, làm sạch nhẹ nhàng. ', 100, 1),
(180, 4, 'Loa Bluetooth JBL Pulse 5', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/299608/loa-bluetooth-jbl-pulse-5-1-1.jpg', 6690000, 10, 'Loa Bluetooth JBL Pulse 5 với dải đèn LED rực rỡ, nổi bật giữa màn đêm, chất âm sôi động giúp bạn khuấy đảo mọi bữa tiệc âm thanh và ánh sáng cùng bạn bè.\r\nChế tác chỉn chu, thiết kế gọn gàng\r\nẤn tượng đầu tiên của mình khi mở hộp là một chiếc loa được thiết kế dạng hình trụ, trông khá gọn gàng và cân đối, dáng loa hơi phình nhẹ ở phần giữa.', 100, 1),
(181, 4, 'Loa Bluetooth JBL Partybox On The Go', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/242824/bluetooth-jbl-partybox-on-the-go-600x600-5-org.jpg', 6990000, 18, 'Thiết kế lạ mắt, phong cách trẻ trung\r\nToàn bộ thân loa bluetooth JBL Partybox On-The-Go được bao phủ bởi gam màu đen hiện đại, mặt trước của loa có logo JBL trên nền đỏ tạo điểm nhấn nổi bật.\r\n\r\nTay cầm ngay 2 cạnh bên của loa cho cảm nhận cầm nắm chắc tay và dễ dàng di chuyển. Loa còn trang bị thêm dây đeo vải, nếu bạn thấy sử dụng tay cầm hơi cồng kềnh thì bạn có thể gắn dây đeo này vào và mang lên vai khá là tiện lợi.', 100, 1),
(182, 4, 'Loa Bluetooth JBL Partybox On The Go', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/242824/bluetooth-jbl-partybox-on-the-go-600x600-5-org.jpg', 6990000, 18, 'Thiết kế lạ mắt, phong cách trẻ trung\r\nToàn bộ thân loa bluetooth JBL Partybox On-The-Go được bao phủ bởi gam màu đen hiện đại, mặt trước của loa có logo JBL trên nền đỏ tạo điểm nhấn nổi bật.\r\n\r\nTay cầm ngay 2 cạnh bên của loa cho cảm nhận cầm nắm chắc tay và dễ dàng di chuyển. Loa còn trang bị thêm dây đeo vải, nếu bạn thấy sử dụng tay cầm hơi cồng kềnh thì bạn có thể gắn dây đeo này vào và mang lên vai khá là tiện lợi.', 100, 1),
(183, 4, 'Loa Bluetooth Rezo Home Series Bag', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/313891/loa-bluetooth-rezo-home-series-bag-1-1.jpg', 850000, 25, 'Loa Bluetooth Rezo Home Series Bag được thiết kế như chiếc lồng đèn đa màu sắc, kích thước nhỏ gọn dễ dàng mang theo, âm thanh Hi-Fi vô cùng ấn tượng, kết nối nhanh chóng, mang đến cho người dùng không gian giải trí chất lượng. \r\n• Loa sở hữu diện mạo đẹp mắt, thiết kế quai xách giúp người dùng có thể mang theo bất cứ đâu một cách tiện lợi.\r\n\r\n• Loa Rezo tích hợp đèn 360 độ mang đến màu sắc độc đáo cho không gian căn phòng của bạn.', 100, 1),
(184, 2, 'Loa Bluetooth Harman Kardon Aura Studio 4 ', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/312524/loa-bluetooth-harman-kardon-aura-studio-4-1.jpg', 4990000, 5, 'Loa Bluetooth Harman Kardon Aura Studio 4 sở hữu công suất lớn 130 W, hệ thống đèn LED đẹp mắt, âm thanh sống động cho bạn trải nghiệm âm nhạc ấn tượng ngay cả khi ở trong nhà hay hoạt động ngoài trời, mang đến cho bạn những trải nghiệm tốt nhất.', 100, 1),
(185, 1, 'Loa Bluetooth JBL Partybox Encore 2Mic', 'LoudSpeaker', 0, 'https://cdn.tgdd.vn/Products/Images/2162/311100/loa-bluetooth-jbl-partybox-encore-2mic-5.jpg', 10900000, 18, 'Loa Bluetooth JBL Partybox Encore 2Mic sở hữu hệ thống đèn LED nổi bật cùng thiết kế vuông vắn đẹp mắt, công nghệ âm thanh sống động và mạnh mẽ, tốc độ kết nối ổn định, tiện lợi sử dụng trong những bữa tiệc cá nhân và các buổi tụ họp bạn bè hàng ngày.\r\n• Thiết kế loa khá gọn gàng, khối lượng khoảng 6.3 kg, trang bị quai xách cứng cáp giúp dễ dàng di chuyển mà không quá bất tiện.\r\n\r\n• Kiểu dáng đẹp mắt với hệ thống đèn LED đa màu làm tăng tính thẩm mỹ cho không gian của bạn.', 100, 1),
(186, 4, 'Pin sạc dự phòng Polymer 10000mAh Không dây Magnetic Type C PD 20W Xmobile T156', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/313723/sac-du-phong-polymer-10000mah-khong-day-magnetic-type-c-pd-20w-xmobile-t156-den-3-2.jpg', 950000, 0, 'Pin sạc dự phòng Polymer 10000mAh Không dây Magnetic Type C PD 20W Xmobile T156 sở hữu kiểu dáng tối giản cùng đế đỡ gập gọn vô cùng tiện lợi, đa dạng màu sắc để bạn dễ dàng lựa chọn, sạc không dây nhanh chóng và tiện lợi.\r\n• Pin sạc dự phòng với diện mạo sang trọng, kích thước nhỏ gọn, đồng hành cùng bạn trong mọi hành trình. Phía hông pin sạc có 5 chấm pin, đèn đầu tiên hiển thị cho sạc Magnetic, 4 đèn còn lại, mỗi đèn 25%, giúp bạn dễ dàng nhận biết và theo dõi quá trình sạc.', 100, 1),
(187, 4, 'Pin sạc dự phòng Polymer 10000mAh Type C 10W AVA+ PB100S', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/245254/pin-polymer-10000mah-type-c-ava-pb100s-trang-3.jpg', 500000, 55, 'Sạc điện thoại của bạn nhiều lần với dung lượng sạc dự phòng 10.000 mAh\r\nKết hợp với hiệu suất sạc ấn tượng 65%, AVA+ PB100S có thể sạc được cho iPhone 11 Pro Max tầm 1.6 lần. Thiết bị có độ tương thích cao với nhiều dòng máy nên bạn có thể cấp năng lượng được cho đa dạng thiết bị từ điện thoại, máy tính bảng đến quạt mini, tai nghe Bluetooth.\r\n\r\nLõi pin Polymer lưu trữ nhiều năng lượng, giảm tình trạng thất thoát năng lượng tối ưu, đảm bảo an toàn khi sử dụng. ', 100, 1),
(188, 4, 'Pin sạc dự phòng Polymer 10000mAh Type C 12W AVA+ PJ JP260', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/244689/pin-polymer-10000mah-type-c-ava-pj-jp260-trang-5-org.jpg', 450000, 45, 'Với dung lượng sạc dự phòng 10.000 mAh, hiệu suất sạc lên đến 65%, AVA+ PJ JP260 đáp ứng nhu cầu sử dụng các thiết bị di động cường độ cao của mọi đối tượng, cho bạn hoàn toàn thoải mái xem phim, \"tám chuyện\" cả ngày mà không còn lo lắng về vấn đề hết pin điện thoại.\r\n\r\nVới khả năng tương thích cao với các thiết bị trên thị trường, ngoài điện thoại, sạc dự phòng còn có thể cung cấp năng lượng cho tai nghe Bluetooth, loa Bluetooth, quạt mini, máy tính bảng,... ', 100, 1),
(189, 2, 'Pin sạc dự phòng 10000mAh Type C PD QC 3.0 30W Anker A1256 ', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/315620/pin-sac-du-phong-10000mah-type-c-pd-qc-3-0-30w-anker-a1256-4-1.jpg', 1180000, 0, 'Pin sạc dự phòng 10000mAh Type C PD QC 3.0 30W Anker A1256 sở hữu gam màu sang trọng, thiết kế đẹp mắt, hiệu suất sạc lớn, tương thích với nhiều thiết bị, mang đến cho người dùng những trải nghiệm hoàn hảo.\r\n• Thiết kế tối giản, gam màu đẹp mắt, pin sạc dự phòng được làm từ chất liệu cao cấp và bền bỉ, cầm khá chắc tay. Kích thước nhỏ gọn, có thể mang theo bất cứ đâu mà không lo chiếm diện tích.', 100, 1),
(190, 4, 'Pin sạc dự phòng Polymer 10000mAh Không dây Magnetic Type C PD 30W Baseus PPCXM10T kèm Cáp Type C', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/316203/sac-du-phong-10000mah-magnetic-typecpd-30w-baseus-ppcxm10t-kem-cap-type-c-trang-41.jpg', 1450000, 0, 'Pin sạc dự phòng Polymer 10000mAh Không dây Magnetic Type C PD 30W Baseus PPCXM10T kèm Cáp Type C với kiểu dáng nhỏ gọn, gam màu trang nhã, công suất sạc cao, dung lượng pin khủng, sạc không dây nhanh chóng và tiện lợi, đồng hành cùng bạn trong những chuyến đi.\r\n• Pin sạc dự phòng hỗ trợ công nghệ sạc không dây Magnetic, cho phép bạn sạc pin 1 cách dễ dàng mà không cần sử dụng cáp sạc.', 100, 1),
(191, 2, 'Pin sạc dự phòng Polymer 5000mAh Không dây Magnetic Type C PD 20W Xmobile DS611', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/309431/sac-du-phong-polymer-5000mah-khong-day-magnetic-type-c-pd-20w-xmobile-ds611-2-1.jpg', 690000, 35, 'Pin sạc dự phòng Polymer 5000mAh Không dây Magnetic Type C PD 20W Xmobile DS611 sở hữu thiết kế độc đáo, công nghệ sạc hiện đại, sạc dự phòng là món phụ kiện nhỏ gọn hỗ trợ nạp pin tiện lợi mỗi ngày, dễ dàng mang theo bất cứ đâu mà không lo chiếm nhiều diện tích.\r\n• Kiểu dáng gọn đẹp, kích thước vừa tay cầm, linh hoạt cất gọn pin sạc dự phòng và mang theo mỗi ngày.', 100, 1),
(192, 2, 'Trạm sạc dự phòng di động 90000mAh PD140W 220V/450W Baseus ioTa BPE45A', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/310238/tram-sac-du-phong-di-dong-90000mah-pd140w-220v-450w-baseus-iota-bpe45a-5-1.jpg', 10990000, 32, 'Trạm sạc dự phòng di động 90000mAh PD140W 220V - 450W Baseus ioTa BPE45A sở hữu thiết kế tối giản, trang bị nhiều cổng sạc cùng khả năng lưu trữ năng lượng lớn giúp trạm sạc đáp ứng nhu cầu sử dụng liên tục cho nhiều thiết bị của người dùng như cấp điện cho quạt, nồi cơm, máy tính, điện thoại,...\r\nThiết kế chỉn chu từng chi tiết, tối ưu trải nghiệm', 100, 1),
(193, 2, 'Pin sạc dự phòng 10000 mAh Type C PD 25W Samsung EB-P3400', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/307306/pin-sac-du-phong-10000mah-type-c-pd-samsung-eb-p3400-3-1.jpg', 990000, 20, 'Pin sạc dự phòng 10000 mAh Type C PD Samsung EB-P3400 sở hữu kiểu dáng mỏng nhẹ, gam màu tinh tế, dung lượng pin lớn cùng hiệu suất sạc khá cao, hứa hẹn mang đến cho người dùng những trải nghiệm vô cùng tuyệt vời.\r\n• Kiểu dáng pin sạc dự phòng gọn chắc, vừa tay cầm, dễ dàng mang theo mọi lúc mọi nơi.\r\n\r\n• Dung lượng pin 10.000 mAh, hiệu suất sạc 66% cho phép người dùng sạc nhiều lần cho các thiết bị như điện thoại thông minh, tai nghe,...', 100, 1),
(194, 2, 'Pin sạc dự phòng 10000mAh Type C PD QC3.0 20W Xmobile Y73', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/308509/pin-sac-du-phong-10000mah-type-c-pd-qc3-0-20w-xmobile-y73-1-1.jpg', 800000, 0, 'Pin sạc dự phòng 10000mAh Type C PD QC3.0 20W Xmobile Y73 sở hữu vẻ ngoài ấn tượng, thiết kế tương đối nhẹ chỉ với 216 g, dung lượng pin lớn, hứa hẹn mang đến cho bạn những trải nghiệm tối ưu.\r\n• Diện mạo pin sạc dự phòng Xmobile độc đáo với kiểu thiết kế trong suốt ở mặt trước có thể nhìn thấy toàn bộ vi mạch bên trong kết hợp cùng gam màu xám và vài chi tiết màu vàng làm pin sạc thêm nổi bật. \r\n\r\n• Lõi pin Li-Ion giúp lưu trữ năng lượng lâu dài, hạn chế tối đa tình trạng rò rỉ, an toàn cho thiết bị trong quá trình sử dụng.', 100, 1),
(195, 4, 'Trạm sạc dự phòng di động 48000mAh PD140W 220V/140W Baseus ioTa BPE14A', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/310237/tram-sac-du-phong-di-dong-48000mah-pd140w-220v-140w-baseus-iota-bpe14a-1-1.jpg', 7990000, 36, 'Trạm sạc dự phòng di động 48000mAh PD140W 220V - 140W Baseus ioTa BPE14A giúp lưu trữ nguồn năng lượng lớn lên đến 48.000 mAh, sạc pin cho nhiều thiết bị cùng lúc với mức công suất lên đến 140 W, đáp ứng nhu cầu sử dụng thiết bị điện tử hàng ngày của người dùng.\r\nThiết kế chắc chắn, trang bị màn hình báo pin tiện lợi', 100, 1),
(196, 1, 'Pin sạc dự phòng Polymer 5000mAh Không dây Magnetic Type C PD 20W LAUT Handy E33A ', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/308491/sac-du-phong-polymer-5000mah-khong-day-magnetic-typecpd-15w-laut-handy-e33a-den-5.jpg', 960000, 20, 'Pin sạc dự phòng Polymer 5000mAh Không dây Magnetic Type C PD 20W LAUT Handy E33A sở hữu kiểu dáng sang trọng, hoạ tiết giả đá đẹp mắt, hỗ trợ sạc không dây giúp tối đa hoá công dụng trong 1 thiết kế nhỏ gọn.\r\n• Kiểu dáng thời trang, khối lượng gọn nhẹ, có thể bỏ sạc dự phòng vào balo hay túi xách để mang theo bất cứ đâu.\r\n\r\n• Pin sạc dự phòng trang bị 2 cách sạc là sạc không dây Magnetic (công suất tối đa 15 W) và sạc có dây qua cổng Type-C (công suất tối đa 20 W), cho phép bạn sử dụng để sạc nhiều dòng điện thoại khác nhau.', 100, 1),
(197, 4, 'Pin sạc dự phòng Polymer 10000mAh Type C PD QC3.0 22.5W Mazer Super Mini V2', 'Battery', 0, 'https://cdn.tgdd.vn/Products/Images/57/308497/pin-sac-du-phong-polymer-10000mah-type-c-pd-qc3-0-22-5w-mazer-super-mini-v2-xanh-5.jpg', 940000, 18, 'Pin sạc dự phòng Polymer 10000mAh Type C PD QC3.0 22.5W Mazer Super Mini V2 với gam màu sang trọng, dung lượng pin đáp ứng tốt các nhu cầu cơ bản, dễ dàng bỏ vào túi hay balo để bổ sung năng lượng kịp thời cho các thiết bị điện tử.\r\n• Kích thước vừa tay cầm, kiểu dáng tối giản, pin sạc gọn chắc, khối lượng chỉ 180 g giúp bạn dễ dàng mang theo bất cứ đâu mà không hề vướng víu hay cồng kềnh.', 100, 1),
(198, 2, 'Camera IP 360 Độ 1080P TP-Link Tapo TC70', 'Camera', 0, 'https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-4-org.jpg', 650000, 10, 'Camera giám sát bao quát tốt không gian với góc quay ngang 360 độ và dọc 114 độ\r\nTP-Link Tapo TC70 giúp người sử dụng nắm bắt tốt mọi diễn biến xung quanh khu vực quan sát, góc quan sát rộng mang đến dữ liệu quan sát giá trị, đồng thời giảm đầu tư cho việc lắp đặt nhiều camera trong 1 khu vực cần giám sát.', 100, 1),
(199, 4, 'Camera IP 360 Độ 1080P IMOU Ranger 2C A22EP-L ', 'Camera', 0, 'https://cdn.tgdd.vn/Products/Images/4728/314597/camera-ip-360-do-1080p-imou-ranger-2c-a22ep-l-14.jpg', 700000, 14, 'Camera IP 360 Độ 1080P IMOU Ranger 2C A22EP-L với kiểu dáng nhỏ nhắn, chân đế bằng phẳng giúp dễ dàng đặt trên bàn hay lắp trên các mặt phẳng, camera hỗ trợ ghi lại bao quát không gian xung quanh với độ sắc nét cao, hứa hẹn mang đến người dùng những trải nghiệm tốt nhất.\r\n• Thiết kế với cực kỳ nhỏ gọn, gam màu tinh tế dễ dàng ẩn nấp ở mọi không gian trong nhà bạn.', 100, 1),
(200, 1, 'Camera IP Ngoài Trời 4MP IMOU Bullet 2E F42FP', 'Camera', 0, 'https://cdn.tgdd.vn/Products/Images/4728/307177/camera-ip-ngoai-troi-4mp-imou-bullet-2e-f42fp-1-2.jpg', 1300000, 18, 'Camera IP Ngoài Trời 4MP IMOU Bullet 2E F42FP với độ sắc nét cao, ghi lại hình ảnh rõ ràng và chính xác ngay cả trong bóng tối, camera hỗ trợ bộ nhớ lưu trữ lớn, mang đến cho bạn những trải nghiệm tuyệt vời.\r\n• Camera trang bị đèn hồng ngoại tầm xa lên đến 30 m, giúp bạn dễ dàng quan sát ngay cả ban đêm.\r\n\r\n• Khả năng chống bụi, chống nước IP67 bảo vệ camera nếu môi trường bên ngoài không thuận lợi.', 100, 1),
(201, 9, 'Chuột Không dây Rapoo B2', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/308678/chuot-khong-day-rapoo-b2-1.jpg', 150000, 33, 'Thiết kế chắc chắn, khối lượng gọn nhẹ chỉ với 60 g dễ dàng mang theo mọi lúc mọi nơi. Ngoài ra, chất liệu sản xuất chuột bền bỉ, nâng cao trải nghiệm trong quá trình sử dụng.', 100, 1),
(202, 13, 'Chuột Không dây DareU LM106G', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/293996/chuot-khong-day-dareu-lm106g-1.jpg', 150000, 33, 'Thiết kế chắc chắn, khối lượng gọn nhẹ chỉ với 60 g dễ dàng mang theo mọi lúc mọi nơi. Ngoài ra, chất liệu sản xuất chuột bền bỉ, nâng cao trải nghiệm trong quá trình sử dụng.', 100, 1);
INSERT INTO `product` (`prodID`, `prodcatID`, `prodName`, `prodType`, `prodView`, `prodImg`, `prodPrice`, `prodSale`, `prodDesc`, `QTY`, `prodRate`) VALUES
(203, 9, 'Chuột Không dây Rapoo M216', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/252625/chuot-khong-day-rapoo-m216-den-1-1.jpg', 200000, 40, 'Bên cạnh đó chuột còn tạo cảm giác êm ái khi sử dụng do có những đường viền cao su xung quanh, phù hợp cho những ai đi học, đi làm,...', 100, 1),
(204, 9, 'Chuột Không dây Bluetooth Silent Rapoo M500', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/229571/chuot-bluetooth-silent-rapoo-m500-1-1.jpg', 500000, 40, 'Thiết kế nhỏ gọn, vừa vặn tay cầm, kiểu dáng năng động, trẻ trung với màu sắc bắt mắt, họa tiết ấn tượng', 100, 1),
(205, 6, 'Chuột Có dây Gaming Asus TUF M3', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/220368/chuot-gaming-asus-tuf-m3-den-2-org.jpg', 550000, 18, 'Chuột Gaming Asus TUF M3 Đen có thiết kế nhỏ gọn, cùng chất liệu nhựa có độ ma sát cao giúp cho việc cầm nắm chắc chắn hơn. Thiết kế công thái học phù hợp với người thuận tay phải. Trọng lượng chỉ 84 gram khá nhẹ, tiện dụng.', 100, 1),
(206, 11, 'Chuột Bluetooth Silent Logitech M240', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/311113/chuot-bluetooth-silent-logitech-m240-1.jpg', 400000, 12, 'Chuột Bluetooth Silent Logitech M240 với kiểu dáng gọn gàng, gam màu đẹp mắt, kích thước vừa vặn tay cầm, kết nối ổn định cùng độ nhạy khá cao, hứa hẹn mang đến cho bạn những trải nghiệm tuyệt vời.', 100, 1),
(207, 12, 'Chuột Bluetooth Microsoft Arc', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/229575/chuot-bluetooth-microsoft-arc-xanh-xam-1-org.jpg', 2620000, 30, 'Microsoft Arc là một trong những mẫu chuột không dây có thiết kế gập duỗi hiếm thấy trên thị trường, được làm mỏng, khối lượng chỉ 205 g, khi cần di chuyển, người dùng đơn giản là duỗi thẳng chuột và nhét vào túi quần, balo, mang đi tới bất cứ nơi đâu bạn muốn, không chút vướng víu, không chút trở ngại, chỉ có sự tiện lợi.', 100, 1),
(208, 11, 'Chuột Không dây Logitech M190', 'Mouse', 0, 'https://down-vn.img.susercontent.com/file/sg-11134201-22120-kbrnpaetdclv77', 390000, 25, 'Chuột Không Dây Logitech M190 có nhiều đường gợn sóng tạo độ bám, cho bạn cầm chuột chắc chắn. Hình dạng chuột uốn cong theo đường cong của bàn tay bạn, phần đuôi chuột nâng cao, vị trí 2 phím trái - phải nâng đỡ và tạo sự dễ chịu cho bàn tay và các ngón tay khi dùng.', 100, 1),
(209, 12, 'Chuột Bluetooth Microsoft Modern Mobile KTF', 'Mouse', 0, 'https://down-vn.img.susercontent.com/file/sg-11134201-22100-itfmxka15mivd4', 965000, 20, 'Chuột máy tính Microsoft có kiểu dáng hình chữ nhật gọn gàng, tinh xảo trong từng chi tiết, 4 gam màu gồm đen, xanh lá nhạt, xanh lam và hồng cho bạn lựa chọn dễ dàng theo sở thích, nhu cầu của mình. Kích thước vừa vặn cho bạn di chuyển nhẹ nhàng trong khi làm việc, giải trí. Chất liệu nhựa nhám giúp cho bề mặt chuột không bị bám vân tay khi dùng.', 100, 1),
(210, 18, 'Chuột Có dây Gaming Corsair M55 RGB Pro', 'Mouse', 0, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR6wb0UmOC7pQQz5i8J_yEMCO9tZHjbexJR4d3cmla2GItzevLtdHA9_HlHjl48imjEmRTqsYJTQAVKNc96iKDwSwU2KOKSRLMUSZS0KfNgnQ24v8j229AI2Es2SV8wI3XiS9FrYhHmZBU&usqp=CAc', 920000, 0, 'Chuột máy tính mang đến sự thoải mái tốt nhất trên tay cầm, vừa vặn, chắc chắn, người dùng kiểm soát tốt mọi thao tác trên chuột, vỏ chuột làm từ nhựa nhám chống trơn trượt. Đây là sản phẩm chuột hợp với người thuận cả hai tay', 100, 1),
(211, 11, 'Chuột Có dây Gaming Logitech G102 Gen2 Lightsync', 'Mouse', 0, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTDGnoE4gcxXKN3H3S8ZYqotFQ5D_t4lu9FHQJJlFxyQDLFfgGtesl1Fsc8ZnyWhWAOlhiN2o_f3bZ89k_h0sxvcEjwjPz2yf_NsG73WpBOcDC6qEWKrHTk10dUr1kMeJMgr2tViURx&usqp=CAc', 600000, 0, 'Mệnh danh là một “siêu chuột quốc dân\" Logitech G102 Gen 2 Lightsync sở hữu hiệu năng cực cao cùng loạt tính năng: dải LED 16.8 triệu màu, nút bấm bền bỉ, chân chuột dày trơn mượt kèm theo một mức giá hầu bao phù hợp với những bạn muốn sự đơn giản nhưng vẫn đi đôi với chất lượng', 100, 1),
(212, 14, 'Chuột Có dây Gaming HyperX Pulsefire FPS Pro RGB', 'Mouse', 0, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRWYQUPe-pxGFhXRPUPC1tlYpT5O5PIkZEFIItAX0wklya4VHgbBSlGmcqFysnitofaJpcw6M8cpor-m6Zwea5sQRN_VBWath_-Q4boRrSp0tSYpo8DkslCQFnmc0IzvhilHjk5jNc&usqp=CAc', 990000, 35, 'HyperX Pulsefire FPS Pro RGB sở hữu cảm biến Pixart 3389 nổi tiếng với độ nhanh nhạy và chính xác, tín hiệu di chuyển mượt mà cho từng thao tác chiến game, không cần tăng tốc độ phần cứng vẫn đảm bảo độ nhạy hoàn hảo nhất', 100, 1),
(213, 9, 'Chuột Không dây Bluetooth Rapoo M160', 'Mouse', 0, 'https://cdn.tgdd.vn/Products/Images/86/246197/chuot-khong-day-bluetooth-rapoo-m160-den-1-1-org.jpg', 250000, 0, 'Khối lượng chuột không dây cực nhẹ 54.7 gram, kết cấu gọn gàng, cầm nắm vừa vặn trong tầm tay của cả nam và nữ giới, 2 cạnh hông có vân nhám chống trượt, di chuyển chuột chắc chắn, dễ cất giữ trong túi xách, balo mang theo khi đi làm, đi học, du lịch,... ', 100, 1),
(214, 18, 'Chuột Có dây Gaming Corsair Harpoon RGB Pro', 'Mouse', 0, 'https://hugotech.vn/wp-content/uploads/CH-9301111-AP.jpg', 500000, 10, 'Sườn cao su, khối lượng chỉ 85 gram cho cho bạn sử dụng chuột gaming dễ dàng, cầm chắc, không mỏi tay khi thao tác liên tục, dùng lâu. Hai cạnh chuột có hoa văn tam giác giúp cầm không bị trơn trượt.', 100, 1),
(215, 11, 'Chuột Không dây Logitech M185', 'Mouse', 0, 'https://hugotech.vn/wp-content/uploads/xam-1-1-600x600.jpg', 285000, 0, 'Logitech M185 có 2 màu vân là đỏ và xanh dương, cho bạn lựa chọn tùy thích.', 100, 1),
(216, 13, 'Bàn Phím Không Dây DareU EK807G', 'Keyboard', 0, 'https://hugotech.vn/wp-content/uploads/DAREU-EK807G-600x600.jpg', 660000, 20, 'Bàn Phím Không Dây DareU EK807G có khối lượng nhẹ với kích thước gọn gàng, thiết kế không dây cho phép dùng linh hoạt, để bạn tùy chọn vị trí sử dụng phù hợp nhất cho riêng mình.', 100, 1),
(217, 9, 'Bàn Phím Cơ Có Dây Gaming Rapoo V500alloy', 'Keyboard', 0, 'https://anphat.com.vn/media/product/43763_rapoo_v500_alloy__1_.png', 550000, 10, 'Rapoo V500alloy trang bị 87 phím cơ bản đủ đáp ứng mọi nhu cầu trên 1 bàn phím làm việc, chơi game thông thường. Có 2 lựa chọn màu chữ trên keycap cho người dùng: Đỏ hoặc Vàng (giao màu ngẫu nhiên).', 100, 1),
(218, 13, 'Bàn Phím Cơ Bluetooth Dareu EK75 Pro', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/314635/ban-phim-co-bluetooth-dareu-ek75-pro-1.jpg', 1390000, 28, 'Bàn Phím Cơ Bluetooth Dareu EK75 Pro sở hữu đầy đủ đặc điểm cần có của một mẫu bàn phím cơ cao cấp, đèn LED RGB đa sắc màu giúp không gian làm việc/giải trí nổi bật trong màn đêm, trang bị switch độc quyền cho hành trình phím sâu, không chiếm quá nhiều diện tích trên bàn làm việc hay balo.', 100, 1),
(219, 16, 'Bàn Phím Cơ Có Dây Gaming Razer BlackWidow V3', 'Keyboard', 0, 'https://hugotech.vn/wp-content/uploads/Ba%CC%80n-phi%CC%81m-Razer-BlackWidow-V3-1-600x600.jpg', 3640000, 45, 'Kiểu dáng hình chữ nhật, các phím được sắp xếp giúp tối ưu thao tác cho người sử dụng, có giá kê tay giúp giảm áp lực cho cổ tay, đảm bảo sự thoải mái ngay cả khi chơi game trong thời gian dài. Có phần khung làm từ nhôm độ bền cao, tin cậy về chất lượng. ', 100, 1),
(220, 16, 'Bàn Phím Cơ Có Dây Gaming Razer Huntsman Tournament Edition', 'Keyboard', 0, 'https://hugotech.vn/wp-content/uploads/ban_phim_co_razer_huntsman_tournament_edition_2_8d3342ca8fcd4d969d80bf49f7bd6d46_master-2.jpg', 3550000, 45, 'Razer Huntsman Tournament Edition lược bỏ vùng phím số cho kích thước bàn phím gọn gàng, dễ dàng bố trí cho mọi không gian làm việc. Thiết kế bàn phím theo phong cách gaming cá tính, nổi bật, đẹp mắt, tô điểm cho bàn làm việc.', 100, 1),
(221, 9, 'Bàn Phím Có Dây Gaming Rapoo V50S', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/314636/ban-phim-co-day-gaming-rapoo-v50s-1.jpg', 390000, 12, 'Bàn Phím Có Dây Gaming Rapoo V50S sở hữu ngoại hình đẹp mắt, hệ thống đèn LED RGB độc đáo, kích thước gọn gàng phù hợp với mọi không gian bàn làm việc hay bàn học.', 100, 1),
(222, 13, 'Bàn Phím Cơ Có Dây Dareu EK75', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/314634/ban-phim-co-co-day-dareu-ek75-1.jpg', 790000, 30, 'Bàn Phím Cơ Có Dây Dareu EK75 với layout nhỏ gọn theo phong cách hiện đại cùng đèn LED RGB giúp góc làm việc, học tập của bạn thêm phần màu sắc và đẹp mắt.', 100, 1),
(223, 20, 'Bàn Phím Cơ Gaming MSI Vigor GK50 Elite', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/313255/ban-phim-co-gaming-msi-vigor-gk50-elite-1.jpg', 2500000, 20, 'Bàn Phím Cơ Gaming MSI Vigor GK50 Elite với thiết kế công thái học tạo sự thoải mái khi sử dụng, kết hợp cùng Kailh Box White và hiệu ứng ánh sáng theo từng phím sẽ mang lại trải nghiệm mới mẻ cho các game thủ', 100, 1),
(224, 6, 'Bàn phím Gaming Asus ROG Strix Scope RX BL SW', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/309764/ban-phim-gaming-asus-rog-strix-scope-rx-bl-sw-den-7.jpg', 2195000, 0, 'Bàn phím Gaming Asus ROG Strix Scope RX BL SW Đen là mẫu bàn phím Full size với thiết kế thời thượng, đèn LED RGB đẹp mắt cùng nhiều tính năng hấp dẫn khác, mang đến cho người dùng những trải nghiệm chơi game, làm việc ấn tượng nhất.', 100, 1),
(225, 6, 'Bàn phím Gaming Asus ROG Strix Scope NX TKL DELUXE RD SW', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/309763/ban-phim-gaming-asus-rog-strix-scope-nx-tkl-deluxe-rd-sw-den-4.jpg', 3690000, 50, 'Bàn phím Gaming Asus ROG Strix Scope NX TKL DELUXE RD SW Đen sở hữu kiểu dáng thời thượng, thiết kế hầm hố cùng hệ thống đèn LED RGB nổi bật, dễ dàng di chuyển mang theo bất cứ đâu, đồng thời tăng tính thẩm mỹ cho không gian của bạn.', 100, 1),
(226, 9, 'Bàn Phím Cơ Bluetooth Rapoo V700 - 8A', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/309383/ban-phim-co-bluetooth-rapoo-v700-8a-1.jpg', 1490000, 10, 'Bàn Phím Cơ Bluetooth Rapoo V700 - 8A có kiểu dáng tối giản cùng cách phối màu độc đáo, kích thước cực kỳ nhỏ gọn không chiếm quá nhiều diện tích khi đặt trên bàn làm việc, dễ dàng bỏ vào balo hay vali để mang theo bất cứ đâu.', 100, 1),
(227, 6, 'Bàn Phím Có Dây Gaming Asus TUF K1', 'Keyboard', 0, 'https://cdn.tgdd.vn/Products/Images/4547/279466/co-day-gaming-asus-tuf-k1-1.jpg', 990000, 10, 'Bàn phím có dây Gaming Asus TUF K1 với thiết kế có phần kê cổ tay tiện dụng, có thể tháo rời để mang lại sự thoải mái dài lâu.', 100, 1),
(228, 13, 'Bàn Phím Bluetooth DareU EK868', 'Keyboard', 0, 'https://hugotech.vn/wp-content/uploads/Dareu-EK868-WHITE-68KEY-600x600.png', 1170000, 10, 'DareU EK868 - Mẫu bàn phím bluetooth của hãng DareU, sở hữu thiết kế cứng cáp, màu sắc trẻ trung cùng keycap thiết kế theo kiểu low-profile độc đáo. Là kiểu rút gọn 68 phím, sử dụng Blue switch mang lại cảm giác gõ nhẹ nhàng và âm thanh cực kỳ bắt tai. Cùng mình tìm hiểu cách sử dụng bàn phím này nhé!', 100, 1),
(229, 13, 'Bàn Phím Có Dây DareU EK87', 'Keyboard', 0, 'https://hugotech.vn/wp-content/uploads/DareU-EK87-WHITE-1.jpg', 650000, 24, 'DareU EK87 - chiếc bàn phím Tenkeyless 87 phím đến từ nhà DareU, thiết kế từ nhựa ABS kết hợp cùng Red Switch mang lại âm thanh gõ phím cực kỳ đã tai. Chiếc bàn phím này sở hữu tông màu trắng/hồng cực kỳ phù hợp với các khách hàng trẻ.', 100, 1),
(230, 16, 'Bàn Phím Cơ Có Dây Gaming Razer BlackWidow', 'Keyboard', 0, 'https://hugotech.vn/wp-content/uploads/Untitled-3-252-600x600-1.jpg', 3200000, 45, 'Logo và tên thương hiệu thể hiện nổi bật trên bàn phím, bề mặt các phím được làm hơi cong cho ngón tay nhấn chuẩn, vị trí sắp đặt từ cao xuống thấp giúp giảm nhức mỏi và tăng sự thoải mái khi sử dụng. ', 100, 1),
(231, 10, 'Cáp Type C 1m Baseus CoolPlay CB000046', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/310589/cap-type-c-1m-baseus-coolplay-cb000046-trang-thumb-1-600x600.jpg', 200000, 30, 'Cáp Type C 1m Baseus CoolPlay CB000046 với chất liệu bền bỉ và cứng cáp, dễ dàng cuộn gọn để vào balo, túi xách mà không lo bị gãy, tiện lợi trong việc mang theo đi học, đi làm. Cáp sạc có thể dùng để sạc và truyền dữ liệu tối ưu.', 100, 1),
(232, 10, 'Cáp Lightning 1m Baseus CoolPlay CB000044', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/310586/cap-lightning-1m-baseus-coolplay-cb000044-thumb-1-600x600.jpg', 240000, 30, 'Cáp Lightning 1m Baseus CoolPlay CB000044 với diện mạo tối giản, dây cáp dài 1 m tiện lợi, cung cấp năng lượng nhanh chóng, chắc chắn đây sẽ là sản phẩm cực kỳ hữu ích hỗ trợ cho người sử dụng tối ưu về vấn đề sạc pin. ', 100, 1),
(233, 10, 'Cáp Type C - Type C 2m Baseus CoolPlay CB000047', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/310583/cap-type-c-type-c-2m-100w-baseus-coolplay-cb000047-thumb-600x600.jpg', 270000, 30, 'Cáp Type C - Type C 2m Baseus CoolPlay CB000047 với gam màu đẹp mắt, kích thước 2 m sử dụng thoải mái, công suất sạc lớn cùng với nhiều tiện ích khác, hứa hẹn mang đến cho bạn những trải nghiệm tuyệt vời.', 100, 1),
(234, 19, 'Cáp Lightning 1m Hydrus CS-C-021', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/249407/caplightning1mhydruscs-c-021-ava-600x600.jpg', 150000, 20, 'Cáp sạc Hydrus có dây dẫn được làm thuôn dài, chuôi cáp chắc chắn, chịu được nhiều lần kéo, gập, thuận tiện cho việc sử dụng, cất giữ. Thiết kế 3 tone màu thời trang gồm màu xanh ngọc thanh thoát, màu xanh Navy sang trọng và màu hồng dễ thương, phù hợp với sở thích của cả phái mạnh và phái đẹp. ', 100, 1),
(235, 15, 'Cáp Lightning 1m Xmobile DR-L001X', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/225601/cap-lightning-1m-xmobile-dr-l001x-do-den-7-600x600.jpg', 190000, 20, 'Màu sắc nổi bật, rất trẻ trung và bắt mắt, thiết kế chắc chắn với lớp vỏ bọc nylon hạn chế tối đa tình trạng xoắn rối hay đứt gãy dây', 100, 1),
(236, 17, 'Cáp Type C 0.2m AVA+ DS06C', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/318329/cap-type-c-20cm-ava-ds06cb-tb-den-thumb-600x600.jpg', 100000, 20, 'Vỏ cáp sạc được làm từ nhựa chất lượng, bao bọc sợi cáp bên trong giúp bảo vệ hiệu quả, cho thời gian sử dụng lâu.', 100, 1),
(237, 19, 'Cáp Type C - Type C 1m Hydrus DS464', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/318329/cap-type-c-20cm-ava-ds06cb-tb-den-thumb-600x600.jpg', 220000, 10, 'Trang bị nhiều mức sạc: 5V - 3A, 9V - 2A, 12V - 3A, 15V - 3A, 20V - 3A, cáp sạc hỗ trợ cung cấp năng lượng tốt cho nhiều loại thiết bị.', 100, 1),
(238, 10, 'Cáp Type C - Type C 1m Baseus Glimmer CB000025', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/318325/cap-type-c-type-c-1m-baseus-glimmer-cb000025-trang-thumb-1-600x600.jpg', 250000, 10, 'Cáp sạc cung cấp năng lượng an toàn cho các thiết bị có mức sạc nhỏ hơn nhờ trang bị chip E - Marker Smart độc quyền nhà Baseus.', 100, 1),
(239, 10, 'Cáp Lightning 1m Baseus Unbreakable CB000048', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/318321/cap-lightning-1m-baseus-unbreakable-cb000048-trang-xanh-thumb-600x600.jpg', 190000, 10, 'Cáp sạc Baseus trang bị công nghệ điều khiển nhiệt thông minh độc quyền, kiểm soát lượng nhiệt toả ra trong quá trình sạc, tránh nóng thiết bị, đảm bảo quá trình sạc an toàn.', 100, 1),
(240, 10, 'Cáp Type C 1m Baseus Explorer CB000042', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/316454/cap-type-c-1m-baseus-explorer-cb000042-trang-xanh-thumb-600x600.jpg', 290000, 10, 'Cáp Type C 1m Baseus Explorer CB000042 sở hữu kiểu dáng đơn giản, chất liệu cáp bền bỉ, bảo vệ tối ưu cho các linh kiện bên trong, công suất sạc lớn cho phép sạc đa số thiết bị điện tử phổ biến hiện nay.', 100, 1),
(241, 10, 'Cáp Type C - Lightning 1m Baseus Explorer CB000040', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/318316/cap-type-c-lightning-1m-baseus-explorer-cb000040-xanh-1-thumb-600x600.jpg', 350000, 30, 'Tốc độ truyền tải dữ liệu lên đến 480 Mbps, cho phép sao chép hình ảnh, âm thanh, video,... một cách nhanh chóng.', 100, 1),
(242, 15, 'Cáp Type C 1m Xmobile L2205', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/311310/cap-type-c-1m-xmobile-l2205-thumb-600x600.jpg', 190000, 0, 'Cáp Type C 1m Xmobile L2205 sở hữu gam màu đẹp mắt, mang phong cách khá đơn giản, chiều dài dây cáp vừa đủ để sử dụng, truyền tải dữ liệu và nạp pin nhanh chóng, cáp không chiếm quá nhiều diện tích trên bàn, hứa hẹn mang đến cho bạn những trải nghiệm tuyệt vời.', 100, 1),
(243, 15, 'Cáp Type C - Lightning 0.2m Xmobile L2203', 'Cable', 0, 'https://cdn.tgdd.vn/Products/Images/58/311309/cap-type-c-lightning-0-2m-xmobile-l2203-thumb-600x600.jpg', 0, 0, 'Cáp Type C - Lightning 0.2m Xmobile L2203 sở hữu diện mạo thanh lịch, gam màu dễ sử dụng, tiện lợi tương thích với mọi thiết bị giúp bạn truyền tải năng lượng và cung cấp năng lượng nhanh chóng, độ dài đến 0.2 m sẽ đem đến cho bạn những cảm nhận hoàn hảo. ', 100, 1),
(244, 2, 'Đồng hồ thông minh Samsung Galaxy Watch5 44mm', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/286034/samsung-galaxy-watch5-44mm-xanh-duong-thumb-10-600x600.jpg', 6490000, 24, 'Màn hình: SUPER AMOLED, 1.4 inch\r\n\r\nTheo dõi sức khỏe: Đo huyết áp (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Điện tâm đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Theo dõi mức độ stress\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi', 100, 1),
(245, 2, 'Đồng hồ thông minh Samsung Galaxy Watch5 Pro LTE 45mm Đen', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/285263/samsung-galaxy-watch5-pro-lte-den-tn-600x600.jpg', 12990000, 0, 'Màn hình: SUPER AMOLED, 1.4 inch\r\n\r\nTheo dõi sức khỏe: Đo huyết áp (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Điện tâm đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Theo dõi mức độ stress\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi', 100, 1),
(246, 2, 'Đồng hồ thông minh Samsung Galaxy Watch4 40mm', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/248752/samsung-galaxy-watch-4-40mm-tn-2-600x600.jpg', 3990000, 7, 'Theo dõi sức khỏe: Đo huyết áp (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Điện tâm đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Đếm số bước chân\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi', 100, 1),
(247, 2, 'Đồng hồ thông minh Samsung Galaxy Watch6 Classic LTE 47mm ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/309543/samsung-galaxy-watch6-classic-lte-47-mm-den-ksp-600x600.jpg', 9990000, 0, 'Màn hình: SUPER AMOLED, 1.5 inch\r\n\r\nTheo dõi sức khỏe: Đo huyết áp (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Điện tâm đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Theo dõi mức độ stress\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(248, 2, 'Đồng hồ thông minh Samsung Galaxy Watch5 Pro 45mm', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/284933/samsung-galaxy-watch5-pro-xam-tn-600x600.jpg', 11990000, 0, 'Màn hình: SUPER AMOLED, 1.4 inch\r\n\r\nTheo dõi sức khỏe: Đo huyết áp (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Điện tâm đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Theo dõi mức độ stress\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi', 100, 1),
(249, 2, 'Đồng hồ thông minh Samsung Galaxy Watch6 Classic 47mm', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/310858/samsung-galaxy-watch6-classic-47-mm-bac-ksp-600x600.jpg', 9490000, 1, 'Màn hình: SUPER AMOLED, 1.3 inch\r\n\r\nTheo dõi sức khỏe: Đo huyết áp (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Điện tâm đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Theo dõi mức độ stress\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(250, 2, 'Đồng hồ thông minh Samsung Galaxy Watch5 44mm', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/286034/samsung-galaxy-watch5-44mm-xanh-duong-thumb-10-600x600.jpg', 6490000, 24, 'Màn hình: SUPER AMOLED, 1.4 inch\r\n\r\nTheo dõi sức khỏe: Đo huyết áp (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Điện tâm đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung), Theo dõi mức độ stress\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi', 100, 1),
(251, 1, 'Đồng hồ thông minh Apple Watch Ultra 2 GPS + Cellular 49mm viền Titanium dây Ocean', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/314710/apple-watch-ultra-lte-49mm-vien-titanium-day-ocean-trang-thumb-4-1-600x600.jpg', 21990000, 0, 'Màn hình: OLED, 1.92 inch\r\n\r\nTheo dõi sức khỏe: Tính quãng đường chạy, Điện tâm đồ, Đếm số bước chân\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(252, 1, 'Đồng hồ thông minh Apple Watch Series 9 GPS + Cellular 45mm viền thép dây thép ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/314701/apple-watch-s9-lte-45mm-vien-thep-khong-gi-day-thep-den-thumb-1-600x600.png', 21590000, 0, 'Màn hình: OLED, 1.9 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Điện tâm đồ\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(253, 1, 'Đồng hồ thông minh Apple Watch Series 9 GPS + Cellular 41mm viền thép dây thép ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/314696/apple-watch-s9-lte-41mm-vien-thep-khong-gi-day-thep-bac-thumb-1-600x600.png', 20290000, 0, 'Màn hình: OLED, 1.9 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Điện tâm đồ\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(254, 1, 'Đồng hồ thông minh Apple Watch Ultra GPS + Cellular 49mm viền Titanium dây Alpine size M ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/289814/apple-watch-ultra-alpine-m-cam-thumbnew-1-600x600.jpg', 19990000, 16, 'Màn hình: OLED, 1.92 inch\r\n\r\nTheo dõi sức khỏe: Tính quãng đường chạy, Điện tâm đồ, Đếm số bước chân\r\n\r\nChế độ luyện tập: Đi bộ, Đạp xe, Chạy bộ', 100, 1),
(255, 1, 'Đồng hồ thông minh Apple Watch Series 9 GPS + Cellular 41mm viền thép dây thể thao', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/314692/apple-watch-s9-lte-41mm-vien-thep-khong-gi-day-silicone-den-thumb-1-600x600.png', 18990000, 0, 'Màn hình: OLED, 1.9 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Điện tâm đồ\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(256, 1, 'Đồng hồ thông minh Apple Watch Series 9 GPS + Cellular 41mm viền nhôm dây thể thao ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/314690/apple-watch-s9-lte-41mm-vien-nhom-day-silicone-trang-thumb-1-600x600.png', 13090000, 0, 'Màn hình: OLED, 1.9 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Điện tâm đồ\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(257, 4, 'Đồng hồ thông minh Xiaomi Watch 2 Pro 46 mm Đen', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/316986/xiaomi-watch-2-pro-tb-600x600.jpg', 5990000, 0, 'Màn hình: AMOLED, 1.43 inch\r\n\r\nTheo dõi sức khỏe: Đếm số bước chân, Đo nồng độ oxy (SpO2), Theo dõi giấc ngủ\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(258, 4, 'Đồng hồ thông minh Xiaomi Redmi Watch 3 Active 46mm', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/311333/redmi-watch-3-active-xam-tn-600x600.jpg', 1090000, 26, 'Màn hình: LCD, 1.83 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Đếm số bước chân, Đo nồng độ oxy (SpO2)\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(259, 4, 'Đồng hồ thông minh Xiaomi Watch S1 46.5mm', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/274192/dong-ho-thong-minh-xiaomi-watch-s1-nau-tn-600x600.jpg', 2990000, 50, 'Màn hình: AMOLED, 1.43 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Đếm số bước chân\r\n\r\nThông báo ứng dụng: Cuộc gọi, Messenger (Facebook), Viber', 100, 1),
(260, 4, 'Đồng hồ tay thông minh Mi Band 7 Pro ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/290757/mi-band-7-pro-den-thumb-600x600.jpg', 1890000, 42, 'Màn hình: AMOLED, 1.64 inch\r\n\r\nTheo dõi sức khỏe: Tính quãng đường chạy, Đếm số bước chân, Theo dõi giấc ngủ\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(261, 4, 'Đồng hồ thông minh Xiaomi Redmi Watch 2 Lite 41.2mm ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/262620/redmi-watch-2-lite-xanh-duong-thumb-3-600x600.jpg', 1490000, 33, 'Màn hình: TFT, 1.55 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Đếm số bước chân\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(262, 4, 'Đồng hồ thông minh Xiaomi Redmi Watch 3 42.6mm ', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/304166/redmi-watch-3-den-tn-600x600.jpg', 2790000, 17, 'Màn hình: AMOLED, 1.75 inch\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Đếm số bước chân, Đo nồng độ oxy (SpO2)\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi', 100, 1),
(263, 4, 'Đồng hồ thông minh Apple Watch SE 2023 GPS + Cellular 40mm viền nhôm dây thể thao', 'Smartwatch', 0, 'https://cdn.tgdd.vn/Products/Images/7077/316003/apple-watch-se-lte-2023-40mm-vien-nhom-day-silicone-trang-thumb-1-600x600.jpg', 7690000, 0, 'Màn hình: OLED\r\n\r\nTheo dõi sức khỏe: Theo dõi mức độ stress, Tính quãng đường chạy, Đếm số bước chân\r\n\r\nThông báo ứng dụng: Tin nhắn, Cuộc gọi, Messenger (Facebook)', 100, 1),
(266, 1, 'Iphone SE 2020', 'Phone', 0, 'data:image/jpeg;base64,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', 1000000, 2, 'ĐT NHƯ L', 20, 1),
(267, 1, 'Iphone SE 2020', 'Phone', 0, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEBAQDxIWEhUVEA8VFRYQFRAVFRAVFRUXFhUVFRcYHSggGBolHRUVIjEjJSorLi4uFx8zODMtNyouLi0BCgoKDg0OGhAQGjclHyAtNS0rLysrLSswLSsrKystNys3NysrLTAtLysuMi0tLSstKzAtLSsrKysrMSstLS01K//AABEIALcBEwMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABgEDBAUHAgj/xABKEAACAQIDAwYICwUHBAMAAAABAgADEQQSIQUxQQYTIlFhcQcVQoGRkqGxFjIzUlRicrLB0dIUI3OCokNTk6PC0/AXJDThCETx/8QAGQEBAQADAQAAAAAAAAAAAAAAAAECBAUD/8QAJhEBAAICAgEDBAMBAAAAAAAAAAECAxESITEEQWEUIjJRobHRE//aAAwDAQACEQMRAD8A7RjcdTpAGo1r7t5J7gJhfCGh85vVaaDl+f3lAfUqe9ZEzKOmfCCh85vVaPhBQ629VpzOVjQ6X8IKHW3qmPhBQ629UzmkreNDpPwgodberKnlBQ629Wc2ErA6JW5SUhay1H+yEFvWYSz8Kaf9zV/yP9yQG8rAnvwpp/3Nb/I/3I+FNP8Aua3+R/uSBReB0VOUNEgEhxpuIFx2GxInr4QUfrerOc3i8Do/j+h1t6pjx/Q629UznEQOj+P6HW3qmefhBR+t6s5zEDo3wgo/W9WPhDQ+t6p/Cc5gQOs0aquoZTcEXBHET3NRyU/8Oj3P99pt5AiIgIiICIiAiIgIiICIiAiIgQnwgfKUPsVPesiklfhA+Uofw6nvWRMyoSt5S8QKyspAgeoiIFYEoJWBWIlYCIlIFYlIgVlIgwKxLOJxC01L1GCqN5PboO8zX/CLC/3v9FX9MDrfJP8A8Oj3P99pt5A+TvL3ZtLDUqdTEhWAa45uubXYngnbNl/1F2X9LH+HX/RIqVRIt', 100000, 12, 'dákjhdjk', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_entry`
--

CREATE TABLE `product_entry` (
  `entryID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `prodImg` text DEFAULT NULL,
  `colorID` int(11) DEFAULT NULL,
  `storageID` int(11) DEFAULT NULL,
  `ramID` int(11) DEFAULT NULL,
  `QTY` int(11) NOT NULL DEFAULT 100,
  `prodPrice` int(11) NOT NULL,
  `discountID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_entry`
--

INSERT INTO `product_entry` (`entryID`, `prodID`, `prodImg`, `colorID`, `storageID`, `ramID`, `QTY`, `prodPrice`, `discountID`) VALUES
(1, 45, NULL, 2, 1, NULL, 100, 28390000, 0),
(2, 45, 'https://didongmoi.com.vn/upload/images/product/apple/iphone-15-pro-chinh-hang-4.jpg', 4, 1, NULL, 100, 27990000, 0),
(3, 45, 'https://cdn.laredoute.com/products/641by641/8/3/2/83250ba8f6ca1bdf823708613f45e9c2.jpg', 7, 1, NULL, 100, 27990000, 0),
(4, 45, 'https://didongmoi.com.vn/upload/images/product/apple/iphone-15-pro-chinh-hang-4.jpg', 4, 2, NULL, 100, 31290000, 0),
(6, 45, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-xanh-la-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 7, 2, NULL, 100, 30290000, 0),
(7, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-den-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 2, 1, NULL, 100, 25790000, NULL),
(9, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-den-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 2, 2, NULL, 100, 28790000, NULL),
(10, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-den-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 2, 3, NULL, 100, 33490000, NULL),
(11, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-trang-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 5, 1, NULL, 100, 25790000, NULL),
(12, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-trang-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 5, 2, NULL, 100, 28790000, NULL),
(13, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-trang-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 5, 3, NULL, 100, 33490000, NULL),
(14, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-xanh-la-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 7, 1, NULL, 100, 25790000, NULL),
(15, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-xanh-la-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 7, 2, NULL, 100, 28790000, NULL),
(16, 46, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-xanh-la-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 7, 3, NULL, 100, 33490000, NULL),
(17, 47, 'https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-hong-thumb-1-600x600.jpg', 12, 1, NULL, 100, 22690000, NULL),
(18, 47, 'https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-hong-thumb-1-600x600.jpg', 12, 2, NULL, 100, 25490000, NULL),
(19, 47, 'https://news.khangz.com/wp-content/uploads/2018/10/iphone-15-pro-den-titan.png', 2, 1, NULL, 100, 21990000, NULL),
(20, 47, 'https://news.khangz.com/wp-content/uploads/2018/10/iphone-15-pro-den-titan.png', 2, 2, NULL, 100, 25490000, NULL),
(21, 47, 'https://mobileworld.com.vn/uploads/product/iPhone_15_Series/thumbs/ip15_plus_vang.webp', 9, 1, NULL, 100, 21990000, NULL),
(22, 47, 'https://mobileworld.com.vn/uploads/product/iPhone_15_Series/thumbs/ip15_plus_vang.webp', 9, 2, NULL, 100, 25790000, NULL),
(23, 47, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-xanh-la-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 7, 1, NULL, 100, 22690000, NULL),
(24, 47, 'https://cdn.trangthienlong.com.vn/wp-content/uploads/2023/09/iphone-15-mau-xanh-la-128gb-256gb-512gb-trang-thien-long-mobile-510x510.jpg', 7, 2, NULL, 100, 25790000, NULL),
(46, 48, 'https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-black-1-1.jpg', 16, 2, NULL, 100, 33490000, NULL),
(47, 48, 'https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-black-1-1.jpg', 16, 3, NULL, 100, 40290000, NULL),
(48, 48, 'https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-black-1-1.jpg', 16, 4, NULL, 100, 44990000, NULL),
(49, 48, 'https://cdn.tgdd.vn/Products/Images/42/305660/iphone-15-pro-max-blue-1.jpg', 14, 2, NULL, 100, 33990000, NULL),
(51, 48, 'https://cdn.tgdd.vn/Products/Images/42/305660/iphone-15-pro-max-blue-1.jpg', 14, 4, NULL, 100, 44990000, NULL),
(52, 48, 'https://cdn.tgdd.vn/Products/Images/42/305660/iphone-15-pro-max-tu-nhien-1.jpg', 15, 2, NULL, 100, 33990000, NULL),
(53, 48, 'https://cdn.tgdd.vn/Products/Images/42/305660/iphone-15-pro-max-tu-nhien-1.jpg', 15, 3, NULL, 100, 40290000, NULL),
(54, 48, 'https://cdn.tgdd.vn/Products/Images/42/305660/iphone-15-pro-max-tu-nhien-1.jpg', 15, 4, NULL, 100, 44990000, NULL),
(55, 49, 'https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-tim-1-1.jpg', 1, 1, NULL, 100, 25190000, NULL),
(56, 49, 'https://cdn.tgdd.vn/Products/Images/42/247508/iphone14-pro-1.jpg', 9, 1, NULL, 100, 25790000, NULL),
(57, 49, 'https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-den-1.jpg', 2, 1, NULL, 100, 25190000, NULL),
(58, 49, 'https://cdn.tgdd.vn/Products/Images/42/289691/iphone14-pro-1.jpg', 9, 2, NULL, 100, 27490000, NULL),
(59, 49, 'https://cdn.tgdd.vn/Products/Images/42/289691/iphone-14-pro-tim-1-2.jpg', 6, 2, NULL, 100, 27490000, NULL),
(75, 158, 'https://cdn.tgdd.vn/Products/Images/54/310763/tai-nghe-bluetooth-true-wireless-ava-freego-a20-2-1.jpg', 4, 4, NULL, 100, 290000, NULL),
(76, 158, 'https://cdn.tgdd.vn/Products/Images/54/310763/tai-nghe-bluetooth-true-wireless-ava-freego-a20-den-2.jpg', 2, 1, NULL, 100, 300000, NULL),
(77, 160, 'https://cdn.tgdd.vn/Products/Images/54/315176/tai-nghe-bluetooth-true-wireless-soul-s-live-30-1-2.jpg', 17, NULL, NULL, 100, 690000, NULL),
(78, 160, 'https://cdn.tgdd.vn/Products/Images/54/315176/tai-nghe-bluetooth-true-wireless-soul-s-live-30-1-1.jpg', 4, NULL, NULL, 100, 700000, NULL),
(79, 160, 'https://cdn.tgdd.vn/Products/Images/54/315176/tai-nghe-bluetooth-true-wireless-soul-s-live-30-1.jpg', 2, NULL, NULL, 100, 720000, NULL),
(80, 161, 'https://cdn.tgdd.vn/Products/Images/54/311315/tai-nghe-bluetooth-true-wireless-ava-buds-life-rider-gt07-trang-5-1.jpg', 4, NULL, NULL, 100, 550000, NULL),
(81, 161, 'https://cdn.tgdd.vn/Products/Images/54/311315/tai-nghe-bluetooth-true-wireless-ava-buds-life-rider-gt07-4-1.jpg', 2, NULL, NULL, 100, 570000, NULL),
(82, 162, 'https://cdn.tgdd.vn/Products/Images/54/287888/tai-nghe-bluetooth-tws-oppo-enco-buds-2-ete41-trang-1.jpg', 4, NULL, NULL, 100, 990000, NULL),
(83, 162, 'https://cdn.tgdd.vn/Products/Images/54/287888/tai-nghe-bluetooth-tws-oppo-enco-buds-2-ete41-den-8.jpg', 2, NULL, NULL, 100, 1000000, NULL),
(84, 163, 'https://cdn.tgdd.vn/Products/Images/54/310762/tai-nghe-bluetooth-true-wireless-havit-tw945-cam-9.jpg', 18, NULL, NULL, 100, 450000, NULL),
(85, 163, 'https://cdn.tgdd.vn/Products/Images/54/310762/tai-nghe-bluetooth-true-wireless-havit-tw945-tim-8.jpg', 1, NULL, NULL, 100, 480000, NULL),
(86, 163, 'https://cdn.tgdd.vn/Products/Images/54/317994/tai-nghe-bluetooth-true-wireless-havit-tw945-den-trang-trang-2.jpg', 4, NULL, NULL, 100, 450000, NULL),
(87, 163, 'https://cdn.tgdd.vn/Products/Images/54/317994/tai-nghe-bluetooth-true-wireless-havit-tw945-den-trang-den-4.jpg', 2, NULL, NULL, 100, 500000, NULL),
(88, 165, 'https://cdn.tgdd.vn/Products/Images/54/304652/tai-nghe-bluetooth-tws-xiaomi-redmi-buds-4-lite-den-6.jpg', 2, NULL, NULL, 100, 790000, NULL),
(89, 165, 'https://cdn.tgdd.vn/Products/Images/54/304652/tai-nghe-bluetooth-tws-xiaomi-redmi-buds-4-lite-6-1.jpg', 4, NULL, NULL, 100, 800000, NULL),
(90, 165, 'https://cdn.tgdd.vn/Products/Images/54/304652/tai-nghe-bluetooth-tws-xiaomi-redmi-buds-4-lite-cam-1.jpg', 18, NULL, NULL, 100, 770000, NULL),
(91, 168, 'https://cdn.tgdd.vn/Products/Images/54/302991/tai-nghe-bluetooth-tws-rezo-air-trang-2.jpeg', 4, NULL, NULL, 100, 890000, NULL),
(92, 168, 'https://cdn.tgdd.vn/Products/Images/54/302991/tai-nghe-bluetooth-tws-rezo-air-den-10.jpeg', 2, NULL, NULL, 100, 900000, NULL),
(93, 168, 'https://cdn.tgdd.vn/Products/Images/54/302991/tai-nghe-bluetooth-tws-rezo-air-tim-5.jpeg', 6, NULL, NULL, 100, 880000, NULL),
(94, 169, 'https://cdn.tgdd.vn/Products/Images/54/310258/tai-nghe-bluetooth-true-wireless-baseus-airnora-2-4.jpg', 5, NULL, NULL, 100, 1400000, NULL),
(95, 169, 'https://cdn.tgdd.vn/Products/Images/54/310258/tai-nghe-bluetooth-true-wireless-baseus-airnora-2-23.jpg', 18, NULL, NULL, 100, 1450000, NULL),
(96, 177, 'https://cdn.tgdd.vn/Products/Images/2162/312682/loa-bluetooth-sony-srs-xb100-den-1.jpg', 2, NULL, NULL, 100, 1499000, NULL),
(97, 177, 'https://cdn.tgdd.vn/Products/Images/2162/312682/loa-bluetooth-sony-srs-xb100-xanh-mint-9.jpg', 17, NULL, NULL, 100, 1450000, NULL),
(98, 177, 'https://cdn.tgdd.vn/Products/Images/2162/312682/loa-bluetooth-sony-srs-xb100-cam-4.jpg', 18, NULL, NULL, 100, 1399000, NULL),
(99, 177, 'https://cdn.tgdd.vn/Products/Images/2162/312682/loa-bluetooth-sony-srs-xb100-trang-1.jpg', 4, NULL, NULL, 100, 1429000, NULL),
(100, 186, 'https://cdn.tgdd.vn/Products/Images/57/313723/sac-du-phong-polymer-10000mah-khong-day-magnetic-type-c-pd-20w-xmobile-t156-den-3-2.jpg', 2, NULL, NULL, 100, 950000, NULL),
(101, 186, 'https://cdn.tgdd.vn/Products/Images/57/313723/sac-du-phong-polymer-10000mah-khong-day-magnetic-type-c-pd-20w-xmobile-t156-14.jpg', 4, NULL, NULL, 100, 980000, NULL),
(102, 186, 'https://cdn.tgdd.vn/Products/Images/57/313723/sac-du-phong-polymer-10000mah-khong-day-magnetic-type-c-pd-20w-xmobile-t156-tim-9.jpg', 1, NULL, NULL, 100, 940000, NULL),
(103, 187, 'https://cdn.tgdd.vn/Products/Images/57/245254/pin-polymer-10000mah-type-c-ava-pb100s-trang-3.jpg', 4, NULL, NULL, 100, 500000, NULL),
(104, 187, 'https://cdn.tgdd.vn/Products/Images/57/245254/pin-polymer-10000mah-type-c-ava-pb100s-den-3.jpg', 2, NULL, NULL, 100, 529000, NULL),
(105, 188, 'https://cdn.tgdd.vn/Products/Images/57/244689/pin-polymer-10000mah-type-c-ava-pj-jp260-trang-5-org.jpg', 4, NULL, NULL, 100, 450000, NULL),
(106, 188, 'https://cdn.tgdd.vn/Products/Images/57/244689/pin-polymer-10000mah-type-c-ava-pj-jp260-navy-3-org.jpg', 17, NULL, NULL, 100, 480000, NULL),
(107, 190, 'https://cdn.tgdd.vn/Products/Images/57/316203/sac-du-phong-10000mah-magnetic-typecpd-30w-baseus-ppcxm10t-kem-cap-type-c-trang-41.jpg', 9, NULL, NULL, 100, 1450000, NULL),
(108, 190, 'https://cdn.tgdd.vn/Products/Images/57/316203/sac-du-phong-10000mah-magnetic-typecpd-30w-baseus-ppcxm10t-kem-cap-type-c-trang-34.jpg', 4, NULL, NULL, 100, 1430000, NULL),
(109, 190, 'https://cdn.tgdd.vn/Products/Images/57/316203/sac-du-phong-10000mah-magnetic-typecpd-30w-baseus-ppcxm10t-kem-cap-type-c-xanh-33.jpg', 8, NULL, NULL, 100, 1400000, NULL),
(110, 196, 'https://cdn.tgdd.vn/Products/Images/57/308491/sac-du-phong-polymer-5000mah-khong-day-magnetic-typecpd-15w-laut-handy-e33a-den-5.jpg', 2, NULL, NULL, 100, 960000, NULL),
(111, 196, 'https://cdn.tgdd.vn/Products/Images/57/308491/sac-du-phong-polymer-5000mah-khong-day-magnetic-typecpd-15w-laut-handy-e33a-trang-5.jpg', 4, NULL, NULL, 100, 920000, NULL),
(112, 197, 'https://cdn.tgdd.vn/Products/Images/57/308497/pin-sac-du-phong-polymer-10000mah-type-c-pd-qc3-0-22-5w-mazer-super-mini-v2-xanh-5.jpg', 5, NULL, NULL, 100, 940000, NULL),
(113, 197, 'https://cdn.tgdd.vn/Products/Images/57/308497/pin-sac-du-phong-polymer-10000mah-type-c-pd-qc3-0-22-5w-mazer-super-mini-v2-den-4-2.jpg', 2, NULL, NULL, 100, 900000, NULL),
(114, 197, 'https://cdn.tgdd.vn/Products/Images/57/308497/pin-sac-du-phong-polymer-10000mah-type-c-pd-qc3-0-22-5w-mazer-super-mini-v2-cam-6.jpg', 18, NULL, NULL, 100, 960000, NULL),
(115, 202, 'https://cdn.tgdd.vn/Products/Images/86/293996/chuot-khong-day-dareu-lm106g-20.jpg', 4, NULL, NULL, 100, 150000, NULL),
(116, 202, 'https://cdn.tgdd.vn/Products/Images/86/293996/chuot-khong-day-dareu-lm106g-1.jpg', 2, NULL, NULL, 100, 150000, NULL),
(117, 204, 'https://cdn.tgdd.vn/Products/Images/86/229571/chuot-bluetooth-silent-rapoo-m500-1-1.jpg', 19, NULL, NULL, 100, 500000, NULL),
(118, 204, 'https://cdn.tgdd.vn/Products/Images/86/229571/chuot-bluetooth-silent-rapoo-m500-xanh-duong-1-1-org.jpg', 5, NULL, NULL, 100, 500000, NULL),
(119, 204, 'https://cdn.tgdd.vn/Products/Images/86/229571/chuot-bluetooth-silent-rapoo-m500-do-1-1-org.jpg', 3, NULL, NULL, 100, 500000, NULL),
(120, 206, 'https://cdn.tgdd.vn/Products/Images/86/311113/chuot-bluetooth-silent-logitech-m240-1.jpg', 2, NULL, NULL, 100, 400000, NULL),
(121, 206, 'https://cdn.tgdd.vn/Products/Images/86/311113/chuot-bluetooth-silent-logitech-m240-10.jpg', 12, NULL, NULL, 100, 420000, NULL),
(122, 206, 'https://cdn.tgdd.vn/Products/Images/86/311113/chuot-bluetooth-silent-logitech-m240-20.jpg', 4, NULL, NULL, 100, 400000, NULL),
(123, 207, 'https://cdn.tgdd.vn/Products/Images/86/229575/chuot-bluetooth-microsoft-arc-xanh-xam-1-org.jpg', 19, NULL, NULL, 100, 2620000, NULL),
(124, 207, 'https://cdn.tgdd.vn/Products/Images/86/229575/chuot-bluetooth-microsoft-arc-den-1-org.jpg', 2, NULL, NULL, 100, 2620000, NULL),
(125, 207, 'https://cdn.tgdd.vn/Products/Images/86/229575/chuot-bluetooth-microsoft-arc-hong-phan-1-org.jpg', 12, NULL, NULL, 100, 2620000, NULL),
(126, 208, 'https://cdn.tgdd.vn/Products/Images/86/233225/chuot-khong-day-logitech-m190-den-1-org.jpg', 2, NULL, NULL, 100, 390000, NULL),
(127, 208, 'https://cdn.tgdd.vn/Products/Images/86/233225/chuot-khong-day-logitech-m190-xanh-den-1-org.jpg', 22, NULL, NULL, 100, 390000, NULL),
(128, 209, 'https://cdn.tgdd.vn/Products/Images/86/225023/chuot-bluetooth-microsoft-modern-mobile-ktf-cam-1-org.jpg', 12, NULL, NULL, 100, 965000, NULL),
(129, 209, 'https://cdn.tgdd.vn/Products/Images/86/225023/chuot-bluetooth-microsoft-modern-mobile-ktf-1-org.jpg', 2, NULL, NULL, 100, 965000, NULL),
(130, 209, 'https://cdn.tgdd.vn/Products/Images/86/225023/chuot-bluetooth-microsoft-modern-mobile-ktf-xanh-1-1-org.jpg', 20, NULL, NULL, 100, 965000, NULL),
(131, 209, 'https://cdn.tgdd.vn/Products/Images/86/225023/chuot-bluetooth-microsoft-modern-mobile-ktf-xanh-1-org.jpg', 24, NULL, NULL, 100, 965000, NULL),
(132, 211, 'https://cdn.tgdd.vn/Products/Images/86/234490/chuot-gaming-logitech-g102-gen2-lightsync-trang-1-org.jpg', 4, NULL, NULL, 100, 600000, NULL),
(133, 211, 'https://cdn.tgdd.vn/Products/Images/86/234490/chuot-gaming-logitech-g102-gen2-lightsync-den-1-org.jpg', 2, NULL, NULL, 100, 600000, NULL),
(134, 215, 'https://cdn.tgdd.vn/Products/Images/86/223821/chuot-khong-day-logitech-m185-2-org.jpg', 3, NULL, NULL, 100, 285000, NULL),
(135, 215, 'https://cdn.tgdd.vn/Products/Images/86/223821/chuot-khong-day-logitech-m185-xanh-1-org.jpg', 5, NULL, NULL, 100, 285000, NULL),
(136, 226, 'https://cdn.tgdd.vn/Products/Images/4547/309383/ban-phim-co-bluetooth-rapoo-v700-8a-1.jpg', 2, NULL, NULL, 100, 1490000, NULL),
(137, 226, 'https://cdn.tgdd.vn/Products/Images/4547/309383/ban-phim-co-bluetooth-rapoo-v700-8a-trang-xam-1.jpg', 23, NULL, NULL, 100, 1490000, NULL),
(138, 232, 'https://cdn.tgdd.vn/Products/Images/58/310586/cap-lightning-1m-baseus-coolplay-cb000044-11.jpg', 4, NULL, NULL, 100, 240000, NULL),
(139, 232, 'https://cdn.tgdd.vn/Products/Images/58/310586/cap-lightning-1m-baseus-coolplay-cb000044-1.jpg', 2, NULL, NULL, 100, 240000, NULL),
(140, 240, 'https://cdn.tgdd.vn/Products/Images/58/316454/cap-type-c-1m-baseus-explorer-cb000042-trang-1.jpg', 4, NULL, NULL, 100, 120000, NULL),
(141, 240, 'https://cdn.tgdd.vn/Products/Images/58/316454/cap-type-c-1m-baseus-explorer-cb000042-xanh-1.jpg', 5, NULL, NULL, 100, 120000, NULL),
(142, 234, 'https://cdn.tgdd.vn/Products/Images/58/249407/cap-lightning-1m-hydrus-cs-c-021-x-2.jpg', 5, NULL, NULL, 100, 150000, NULL),
(143, 234, 'https://cdn.tgdd.vn/Products/Images/58/249407/cap-lightning-1m-hydrus-cs-c-021-h-2.jpg', 12, NULL, NULL, 100, 150000, NULL),
(144, 234, 'https://cdn.tgdd.vn/Products/Images/58/249407/cap-lightning-1m-hydrus-cs-c-021-x-2.jpg', 24, NULL, NULL, 100, 150000, NULL),
(145, 234, 'https://cdn.tgdd.vn/Products/Images/58/249407/cap-lightning-1m-hydrus-cs-c-021-h-2.jpg', 12, NULL, NULL, 100, 150000, NULL),
(146, 246, 'https://cdn.tgdd.vn/Products/Images/7077/248752/samsung-galaxy-watch-4-40mm-tn-2-600x600.jpg', 21, NULL, NULL, 100, 3990000, NULL),
(147, 246, 'https://cdn.tgdd.vn/Products/Images/7077/248752/samsung-galaxy-watch-4-40mm-den-tn-2-600x600.jpg', 2, NULL, NULL, 100, 3690000, NULL),
(148, 248, 'https://cdn.tgdd.vn/Products/Images/7077/284933/samsung-galaxy-watch5-pro-xam-tn-600x600.jpg', 19, NULL, NULL, 100, 11990000, NULL),
(149, 248, 'https://cdn.tgdd.vn/Products/Images/7077/284933/samsung-galaxy-watch5-pro-den-tn-600x600.jpg', 2, NULL, NULL, 100, 11990000, NULL),
(150, 251, 'https://cdn.tgdd.vn/Products/Images/7077/314710/apple-watch-ultra-lte-49mm-vien-titanium-day-ocean-xanh-duong-thumb-4-1-600x600.jpg', 5, NULL, NULL, 100, 21990000, NULL),
(151, 251, 'https://cdn.tgdd.vn/Products/Images/7077/314710/apple-watch-ultra-lte-49mm-vien-titanium-day-ocean-cam-thumb-4-1-600x600.jpg', 18, NULL, NULL, 100, 21990000, NULL),
(152, 252, 'https://cdn.tgdd.vn/Products/Images/7077/314701/apple-watch-s9-lte-45mm-vien-thep-khong-gi-day-thep-bac-thumb-1-600x600.png', 4, NULL, NULL, 100, 21590000, NULL),
(153, 252, 'https://cdn.tgdd.vn/Products/Images/7077/314701/apple-watch-s9-lte-45mm-vien-thep-khong-gi-day-thep-vang-thumb-1-600x600.png', 9, NULL, NULL, 100, 21590000, NULL),
(154, 253, 'https://cdn.tgdd.vn/Products/Images/7077/314696/apple-watch-s9-lte-41mm-vien-thep-khong-gi-day-thep-den-thumb-1-600x600.png', 2, NULL, NULL, 100, 20290000, NULL),
(155, 253, 'https://cdn.tgdd.vn/Products/Images/7077/314696/apple-watch-s9-lte-41mm-vien-thep-khong-gi-day-thep-vang-thumb-1-600x600.png', 9, NULL, NULL, 100, 20290000, NULL),
(287, 16, 'https://phucanhcdn.com/media/product/38490_apple_iphone_se_2020_1.png', 2, 2, NULL, 100, 1000, NULL),
(288, 16, 'https://phucanhcdn.com/media/product/38490_apple_iphone_se_2020_1.png', 10, 2, NULL, 100, 1500, NULL),
(289, 7, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR-mojMPYgOP0Mi0RexIsEtf4Se0sengNqt9ciujJ2ZqwKxgfKOCMOM6iBu2o63-xZpV_9xWClM6Q9kj6ym_q-Rd_vOf-bzACvl1qTvbuPQ-8jzRfZydOxsjMVD2Mk7iQ&usqp=CAc', 2, 1, NULL, 100, 24999999, NULL),
(290, 7, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR-mojMPYgOP0Mi0RexIsEtf4Se0sengNqt9ciujJ2ZqwKxgfKOCMOM6iBu2o63-xZpV_9xWClM6Q9kj6ym_q-Rd_vOf-bzACvl1qTvbuPQ-8jzRfZydOxsjMVD2Mk7iQ&usqp=CAc', 3, 2, NULL, 100, 26999999, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ram`
--

CREATE TABLE `ram` (
  `ramID` int(11) NOT NULL,
  `ram` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `ram`
--

INSERT INTO `ram` (`ramID`, `ram`) VALUES
(1, '8GB'),
(2, '16GB'),
(3, '32GB'),
(4, '64GB');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `storage`
--

CREATE TABLE `storage` (
  `storageID` int(11) NOT NULL,
  `storage_value` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `storage`
--

INSERT INTO `storage` (`storageID`, `storage_value`) VALUES
(1, '128GB'),
(2, '256GB'),
(3, '512GB'),
(4, '1TB');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `verified` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `email`, `admin`, `verified`) VALUES
(54, 'admin', 'admin', 'admin@gmail.com', 1, 1),
(55, 'hoàng phúc', '$2b$10$UAB5BAiu8lERZOc1dEVV5uloBYbrEYwqBzVBl8qrp1DrFaSGmWktO', 'phuc12345@gmail.com', 0, 0),
(56, 'Nguyen Hoang Phuc (FPL HCM)', NULL, 'phucnhps27304@fpt.edu.vn', 0, 1),
(58, 'adminphuc', '$2b$10$v6cMwd7UYGGofGE954loO.NEGivG40T3ekFM7m4LQeOY60q0GQuUO', 'adminphuc@gmail.com', 1, 0),
(61, 'Phát Ho', NULL, 'leesinttb@gmail.com', 0, 1),
(62, 'Phát Ho', NULL, 'leesinttb@gmail.com', 0, 1),
(63, 'Phát Ho', NULL, 'leesinttb@gmail.com', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_address`
--

CREATE TABLE `user_address` (
  `addressID` int(255) NOT NULL,
  `userID` int(255) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `flat` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_address`
--

INSERT INTO `user_address` (`addressID`, `userID`, `firstname`, `lastname`, `flat`, `street`, `city`, `state`, `mobile`) VALUES
(29, 58, 'Nguyễn Hoàng ', 'Phúc', '73/14', 'Tân Sơn Nhì', 'Quận Tân Phú', 'Thành phố Hồ Chí Minh', '0389431910');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `storageID` int(11) DEFAULT NULL,
  `colorID` int(11) DEFAULT NULL,
  `ramID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`wishlistID`, `prodID`, `userID`, `storageID`, `colorID`, `ramID`) VALUES
(16, 6, 54, NULL, NULL, NULL),
(17, 7, 54, NULL, NULL, NULL),
(18, 45, 58, 1, 2, NULL),
(19, 44, 58, NULL, NULL, NULL),
(20, 46, 58, 1, 2, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`bannerID`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blogID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`prodcatID`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`prodID`,`prodcatID`),
  ADD KEY `catID` (`prodcatID`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`colorID`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discountID`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `prodID` (`prodID`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `quantity` (`quantity`),
  ADD KEY `prodID` (`prodID`),
  ADD KEY `infoID` (`infoID`);

--
-- Chỉ mục cho bảng `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`infoID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `addressID` (`addressID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodID`);

--
-- Chỉ mục cho bảng `product_entry`
--
ALTER TABLE `product_entry`
  ADD PRIMARY KEY (`entryID`),
  ADD KEY `prodID` (`prodID`),
  ADD KEY `colorID` (`colorID`),
  ADD KEY `storageID` (`storageID`),
  ADD KEY `discountID` (`discountID`),
  ADD KEY `ramID` (`ramID`);

--
-- Chỉ mục cho bảng `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ramID`);

--
-- Chỉ mục cho bảng `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storageID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Chỉ mục cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`addressID`),
  ADD KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlistID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `bannerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `blogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `colorID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `order_info`
--
ALTER TABLE `order_info`
  MODIFY `infoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `prodID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT cho bảng `product_entry`
--
ALTER TABLE `product_entry`
  MODIFY `entryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT cho bảng `ram`
--
ALTER TABLE `ram`
  MODIFY `ramID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `storage`
--
ALTER TABLE `storage`
  MODIFY `storageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `user_address`
--
ALTER TABLE `user_address`
  MODIFY `addressID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`prodcatID`) REFERENCES `category` (`prodcatID`),
  ADD CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`infoID`) REFERENCES `order_info` (`infoID`);

--
-- Các ràng buộc cho bảng `order_info`
--
ALTER TABLE `order_info`
  ADD CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Các ràng buộc cho bảng `product_entry`
--
ALTER TABLE `product_entry`
  ADD CONSTRAINT `product_entry_ibfk_2` FOREIGN KEY (`colorID`) REFERENCES `color` (`colorID`),
  ADD CONSTRAINT `product_entry_ibfk_3` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`),
  ADD CONSTRAINT `product_entry_ibfk_4` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);

--
-- Các ràng buộc cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
