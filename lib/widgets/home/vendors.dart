import 'package:flutter/material.dart';
import '../../core/navigations/routers.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Vendords', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vendor path navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Our Vendors', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  Text('Vendords', style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            
            // Category tabs
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildCategoryTab('All', isSelected: true),
                  _buildCategoryTab('Books'),
                  _buildCategoryTab('Poems'),
                  _buildCategoryTab('Special for you'),
                  _buildCategoryTab('Stat'),
                ],
              ),
            ),
            
            // Divider
            Divider(height: 1, thickness: 1, color: Colors.grey[200]),
            
            // Vendors grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                padding: EdgeInsets.all(12),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildVendorCard('Wattpad', 'assets/images/wattpad.png', 4),
                  _buildVendorCard('Kuromi', 'assets/images/kuromi.png', 5),
                  _buildVendorCard('Crane & Co', 'assets/images/crane.png', 5),
                  _buildVendorCard('GooDay', 'assets/images/gooday.png', 4),
                  _buildVendorCard('Warehouse', 'assets/images/warehouse.png', 4),
                  _buildVendorCard('Peppa Pig', 'assets/images/peppa_pig.png', 5),
                  _buildVendorCard('Jstor', 'assets/images/jstor.png', 4),
                  _buildVendorCard('Peloton', 'assets/images/peloton.png', 4),
                  _buildVendorCard('Haymarket', 'assets/images/haymarket.png', 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 40,
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  Widget _buildVendorCard(String name, String imagePath, int rating) {
    return Column(
      children: [
        // Logo container
        Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Vendor name
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Rating stars
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16,
            );
          }),
        ),
      ],
    );
  }
}