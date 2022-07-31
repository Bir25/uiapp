class Book
{
  final String imageUrl;
  final String title;
  final String summary;
  final String ratingStar;
  final String genre;

Book(
{
  required this.imageUrl,
  required this.genre,
  required this.ratingStar,
  required this.title,
  required this.summary

}
    );
}
List<Book> books = [
  Book(imageUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/0/04/ShelteringSky.jpg/220px-ShelteringSky.jpg',
      genre:' Novel', ratingStar: '⭐⭐⭐⭐', title: 'The Sheltering Sky', summary: 'The Sheltering Sky is a 1949 novel of alienation and existential despair by American writer and composer Paul Bowles.'),
  Book(imageUrl: 'https://images.penguinrandomhouse.com/cover/9780307383419',
      genre: 'Memoir', ratingStar: '⭐⭐⭐⭐⭐', title: 'Dreams Father', summary: 'Dreams Father: A Story of Race and Inheritance (1995) is a memoir by Barack Obama that explores the events of his early years in Honolulu and ...'),
  Book(imageUrl: 'https://static.wikia.nocookie.net/harrypotter/images/d/da/Deathly_Hallows_New_Cover.jpg/revision/latest/scale-to-width-down/1200?cb=20170109054859', genre: 'Fantasy', ratingStar: '⭐⭐⭐⭐', title: 'Harry Potter ', summary: 'Harry Potter and the Deathly Hallows (2007), the last novel in J.K. Rowling'),
  Book(imageUrl:'https://assets.americanliterature.com/al/images/book/robinson-crusoe.jpg', genre: ' Adventure', ratingStar: '⭐⭐⭐', title:'Robinson Crusoe', summary: 'Robinson Crusoe is a novel by Daniel Defoe, first published on 25 April 1719. The first edition credited the work protagonist Robinson Crusoe as its author, leading many readers to believe he was a real person and the book a travelogue of true incidents.'),
];
