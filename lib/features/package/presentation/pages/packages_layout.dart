import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moein_moradi/core/network/app_urls.dart';
import 'package:moein_moradi/features/package/data/models/package_model.dart';

class PackagesLayout extends StatefulWidget {
  const PackagesLayout({super.key});

  @override
  State<PackagesLayout> createState() => _PackagesLayoutState();
}

class _PackagesLayoutState extends State<PackagesLayout> {
  List<PackageModel> packages = [];
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    final response = await dio.get(
      AppUrls.getPackages,
    );

    if (response.statusCode == 200) {
      final List<dynamic> packageNames = response.data['packages']
          .map<dynamic>((pkg) => pkg['package'])
          .toList();

      List<PackageModel> detailedPackages = [];
      for (String packageName in packageNames) {
        final packageDetails = await fetchPackageDetails(packageName);
        detailedPackages.add(packageDetails);
      }

      setState(() {
        packages = detailedPackages;
      });
    } else {
      throw Exception('Failed to load packages');
    }
  }

  Future<PackageModel> fetchPackageDetails(String packageName) async {
    final response = await dio.get(
      AppUrls.getPackageDetails(packageName),
    );

    if (response.statusCode == 200) {
      return PackageModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load package details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return packages.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 28.0, // spacing between rows
              crossAxisSpacing: 22.0, // spacing between columns
              childAspectRatio: 16 / 9,
            ),
            itemCount: packages.length, // total number of items
            itemBuilder: (context, index) {
              PackageModel package = packages[index];
              TextStyle titleStype = const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              );
              Color platformColor = const Color(0xff1967D2);
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${package.name}:",
                                style: titleStype,
                              ),
                              Text(
                                " ^${package.latest!.version!}",
                                style: titleStype,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 28,
                            color: const Color(0xff1967D2).withOpacity(0.4),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        package.latest!.pubspec!.description!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xffe7f8ff),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "PLATFORM",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: platformColor,
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color: platformColor.withOpacity(0.3),
                              width: 1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  package.latest!.pubspec!.platforms!
                                      .platfomrsCount!,
                                  (index) {
                                    String platform = package.latest!.pubspec!
                                        .platforms!.platforms![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        platform,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: platformColor,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
