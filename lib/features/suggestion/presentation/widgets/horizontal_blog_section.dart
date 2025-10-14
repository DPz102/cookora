import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HorizontalBlogSection extends StatefulWidget {
  const HorizontalBlogSection({super.key});

  @override
  State<HorizontalBlogSection> createState() => _HorizontalBlogSectionState();
}

class _HorizontalBlogSectionState extends State<HorizontalBlogSection> {
  // YÊU CẦU: Giảm viewportFraction để hiển thị nhiều card hơn
  final _pageController = PageController(viewportFraction: 0.75);

  // Dữ liệu mẫu cho các bài blog
  final List<Map<String, dynamic>> _blogs = [
    {
      'imageUrl': 'https://picsum.photos/800/400?random=10',
      'category': 'Review',
      'date': '14 OCT 2025',
      'title': '5 Mẹo Tối Ưu Hiệu Năng Flutter',
      'description':
          'Khám phá các kỹ thuật giúp ứng dụng của bạn chạy nhanh và mượt mà hơn...',
    },
    {
      'imageUrl': 'https://picsum.photos/800/400?random=11',
      'category': 'Review',
      'date': '12 OCT 2025',
      'title': 'State Management: Riverpod vs. Bloc',
      'description':
          'So sánh hai thư viện quản lý trạng thái phổ biến nhất trong hệ sinh thái Flutter.',
    },
    {
      'imageUrl': 'https://picsum.photos/800/400?random=12',
      'category': 'Review',
      'date': '10 OCT 2025',
      'title': 'Xây Dựng UI Phức Tạp Với CustomPaint',
      'description':
          'Học cách vẽ và tạo ra những giao diện độc đáo mà không bị giới hạn bởi widget có sẵn.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tổng chiều cao của card = chiều cao ảnh + chiều cao nội dung
    const totalCardHeight = _BlogCard.imageHeight + _BlogCard.infoHeight;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: totalCardHeight.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _blogs.length,
              clipBehavior: Clip.none, // Để shadow không bị cắt
              itemBuilder: (context, index) {
                // Tính toán hiệu ứng scale cho mỗi card
                double scale = 1.0;
                if (_pageController.hasClients) {
                  double page = _pageController.page ?? 0;
                  // Tính khoảng cách của card hiện tại so với trang trung tâm
                  double pageDiff = (page - index).abs();
                  // Card càng xa trung tâm thì càng nhỏ lại (tối đa 85%)
                  scale = (1 - (pageDiff * 0.15)).clamp(0.85, 1.0);
                }

                final blog = _blogs[index];

                // Bọc card trong Transform.scale để áp dụng hiệu ứng
                return Transform.scale(
                  scale: scale,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: _BlogCard(
                      imageUrl: blog['imageUrl'],
                      category: blog['category'],
                      date: blog['date'],
                      title: blog['title'],
                      description: blog['description'],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          // Chỉ báo trang (dấu chấm)
          SmoothPageIndicator(
            controller: _pageController,
            count: _blogs.length,
            effect: WormEffect(
              dotHeight: 8.h,
              dotWidth: 8.w,
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotColor: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlogCard extends StatelessWidget {
  // Định nghĩa các hằng số kích thước để dễ quản lý
  static const double imageHeight = 100;
  static const double infoHeight = 120;

  final String imageUrl;
  final String category;
  final String date;
  final String title;
  final String description;

  const _BlogCard({
    required this.imageUrl,
    required this.category,
    required this.date,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(19.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      // ClipRRect để đảm bảo các thành phần con tuân thủ bo góc
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19.r),
        child: Column(
          children: [_buildImageSection(context), _buildInfoSection(context)],
        ),
      ),
    );
  }

  // Widget cho phần ảnh (cao 68)
  Widget _buildImageSection(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: imageHeight.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Tag "Review" ở góc trên bên trái
          Positioned(
            top: 10.h,
            left: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                // YÊU CẦU: Nền xanh
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                category.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 8.sp,
                ),
              ),
            ),
          ),
          // Tag "7 min read" ở góc dưới bên trái
          Positioned(
            bottom: 8.h,
            left: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.timer_outlined, color: Colors.white, size: 12.sp),
                  SizedBox(width: 4.w),
                  Text(
                    '7 phút đọc', // YÊU CẦU: Gán cứng thời gian đọc
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget cho phần nội dung (cao 98)
  Widget _buildInfoSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      height: infoHeight.h,
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dòng trên cùng: Ngày đăng
          Text(
            date,
            style: textTheme.bodySmall?.copyWith(color: colorScheme.outline),
          ),
          SizedBox(height: 6.h),
          // Dòng tiêu đề
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6.h),
          // Dòng mô tả ngắn
          Text(
            description,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(), // Đẩy nội dung bên dưới xuống đáy
          // Dòng "Đọc thêm"
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Đọc thêm',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.arrow_forward,
                color: colorScheme.primary,
                size: 14.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
