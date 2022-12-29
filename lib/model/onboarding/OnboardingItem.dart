class OnboardingItem {
  var image;

  var title;

  var subtitle;

  OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnboardingItem> onBoardingItems = [
  OnboardingItem(
      title: "Online Booking Ticket",
      subtitle:
          "Booking flight ticket made easy with Flyket. Now you can booking your flight anywhere.",
      image: "assets/images/onboarding1.png"),
  OnboardingItem(
      title: "Best Price",
      subtitle:
          "Compare the price from so many airlines and get one flight that suit for your need.",
      image: "assets/images/onboarding2.png"),
  OnboardingItem(
      title: "Up-to Date Notification",
      subtitle:
          "No need to worry about missed the flight, Flyket will notify all the update from your flight.",
      image: "assets/images/onboarding3.png"),
];
