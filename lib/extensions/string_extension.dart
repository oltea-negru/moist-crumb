extension StringExtension on String {
  /// Capitalizes the first letter of each word in the string
  /// Example: "hello world" -> "Hello World"
  String capitalizeAll() {
    if (isEmpty) return this;
    
    return split(' ')
        .map((word) => word.isNotEmpty 
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : word)
        .join(' ');
  }
  
  /// Capitalizes only the first letter of the entire string
  /// Example: "hello world" -> "Hello world"
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
