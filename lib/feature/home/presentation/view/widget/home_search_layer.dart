import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/generated/l10n.dart';

class HomeSearchLayer extends StatelessWidget {
  const HomeSearchLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: InkWell(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/img/search.svg',
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      S.of(context).search_here,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          flex: 1,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.secondColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/img/sort.svg',
                  height: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchItem = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchesQuery = [];
    for (var fruit in searchItem) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchesQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchesQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchesQuery[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchesQuery = [];
    for (var fruit in searchItem) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchesQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchesQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchesQuery[index]),
        );
      },
    );
  }
}
