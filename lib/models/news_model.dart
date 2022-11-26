class NewsData {
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? date;

  //let's create the constructor
  NewsData(
    this.title,
    this.author,
    this.content,
    this.date,
    this.urlToImage,
  );

  //we will use dummy data to generate the news,but you can use a third party api or your own backend to extract the data
  //I will copy the data from my previous code, you can create your own data , I used newsApi to get the data
  static List<NewsData> breakingNewsData = [
    NewsData(
        "U.S. Gas Prices Fall Below \$4 a Gallon, AAA Says - The New York Times",
        "Isabella Simonetti",
        "After peaking in June, they are back where they were in March, offering some relief to consumers and policymakers amid inflation worries.",
        "2022-08-11",
        "https://nypost.com/wp-content/uploads/sites/2/2022/08/twitter-election-misinformation-99.jpg?quality=75&strip=all&w=1024"),
    NewsData(
        "BYD Is Taking Electric Vehicles To The World!",
        "Remeredzai Joseph Kuhudzai",
        "There was quite a bit of drama on several forums following reports in various media platforms around the world that BYD has overtaken Telsa to become the top-selling EV company. In fact, there was quite a bit of an uproar from some circles that felt that it w…",
        "2022-08-11",
        "https://cleantechnica.com/files/2022/05/BYD-Atto-3.jpeg"),
    NewsData(
        "Unexpected storms diverted 100 American Airlines flights and sparked hundreds of cancellations",
        "Marnie Hunter",
        "Severe thunderstorms around Dallas-Fort Worth International Airport on Wednesday caused 100 American Airlines flight diversions and led to hundreds of cancellations that extended into Thursday's schedule.",
        "2022-08-11",
        "https://cdn.cnn.com/cnnnext/dam/assets/220811123809-dfw-american-airlines-file-restricted-super-tease.jpg"),
  ];

  static List<NewsData> recentNewsData = [
    NewsData(
        "Kisan Credit Card: Interest Subvention on KCC Loans Approved, Only 4% Interest on Loans Upto Rs 3 lakh",
        "Amanda Silberling",
        "According to an RBI statement, farmers who take out short-term loans through Kisan Credit Card (KCC) will only be required to pay 4% interest provided they repay the money within a year of the date of disbursement.",
        "2022-11-22",
        "https://kj1bcdn.b-cdn.net/media/81224/only-4-interest-on-short-term-kcc-loans-upto-rs-3-lakh-if-repaid-in-1-year.jpg?format=webp&width=1280"),
    NewsData(
        "KRISHITHON 2022: New Holland Agriculture Exhibits Its Farm Mechanization Solutions",
        "Lauren Forristal",
        "KRISHITHON is India's largest agricultural exhibition, held in Nashik, the country's wine capital. The exhibition is critical in showcasing the most recent agricultural innovations.",
        "2022-11-11",
        "https://kj1bcdn.b-cdn.net/media/81214/new-holland-agriculture-stall-at-krishithon-2022.jpeg?format=webp&width=1280"),
    NewsData(
        "iron batteries could be key to displacing natural gas from the grid",
        "Tim De Chant",
        "VoltStorage recently raised a Series C worth \$24 million from engine manufacturer Cummins. Its previous rounds included investments from SOSV and EIT InnoEnergy.",
        "2022-08-11",
        "https://techcrunch.com/wp-content/uploads/2022/08/electrical-grid-at-night.jpg?w=600"),
    NewsData(
        "PM Kisan: Govt. to Release 13th Installment Soon; Know How to Register and Update e-KYC",
        "Anita Ramaswamy",
        "According to several media reports, the 13th installment of Pradhan Mantri Kisan Samman Nidhi Yojana will be released in the month of December. However, the government has made no official announcement regarding this. Farmers who haven’t applied for the scheme can also take benefit of this, all they need to do is go to the official website of PM Kisan and register themselves. If they are not able to do it online, they can visit the nearest CSC center and apply for the scheme.",
        "2022-08-11",
        "https://kj1bcdn.b-cdn.net/media/39209/farmers.png?format=webp&width=1280"),
    NewsData(
        "Massive iron batteries could be key to displacing natural gas from the grid",
        "Tim De Chant",
        "VoltStorage recently raised a Series C worth \$24 million from engine manufacturer Cummins. Its previous rounds included investments from SOSV and EIT InnoEnergy.",
        "2022-08-11",
        "https://techcrunch.com/wp-content/uploads/2022/08/electrical-grid-at-night.jpg?w=600"),
    NewsData(
        "Mark Cuban, Mavericks in hot water over Voyager \"Ponzi scheme\"",
        "Anita Ramaswamy",
        "The class-action lawsuit alleges that Cuban's promotion of now-bankrupt crypto firm Voyager cost investors \$5 billion",
        "2022-08-11",
        "https://techcrunch.com/wp-content/uploads/2016/02/54816c7904ab43c9af6a09d12d936b0e.jpg?w=600"),
  ];
}
