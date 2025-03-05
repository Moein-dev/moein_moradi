import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moein_moradi/config/extensions/extensions.dart';
import 'package:moein_moradi/core/models/image_model.dart';
import 'package:moein_moradi/core/widgets/image_builder.dart';
import 'package:moein_moradi/features/articles/data/models/article_item_model.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleItem article;
  final VoidCallback onPressed;
  const ArticleWidget({
    super.key,
    required this.article,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double radius = 15;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageBuilder(
                width: 200,
                fit: BoxFit.fitHeight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
                image: ImageModel(
                  networkImage: article.contentEncoded!.findImageUrl,
                ),
              ),
              const Gap(10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            article.title!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.open_in_new_outlined,
                            size: 24,
                            color: const Color(0xff1967D2).withOpacity(0.4),
                          ),
                        ],
                      ),
                      Text(
                        article.contentEncoded!.removeHtmlTags
                            .substring(0, 200),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        article.dcCreator!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(20),
                      Row(
                        children: List.generate(
                          article.category!.length,
                          (index) {
                            String category = article.category![index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                category,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
