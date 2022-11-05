enum FilterBy { all, today, upcoming }

extension FilterByX on FilterBy {
  int get id {
    switch (this) {
      case FilterBy.all:
        return 0;
      case FilterBy.today:
        return 1;
      case FilterBy.upcoming:
        return 2;
    }
  }

  String get statusFilterBy {
    switch (this) {
      case FilterBy.all:
        return 'All';
      case FilterBy.today:
        return 'Today';
      case FilterBy.upcoming:
        return 'Upcoming';
    }
  }
}

FilterBy filterById(int id) {
  switch (id) {
    case 1:
      return FilterBy.today;
    case 2:
      return FilterBy.upcoming;
    default:
      return FilterBy.all;
  }
}
