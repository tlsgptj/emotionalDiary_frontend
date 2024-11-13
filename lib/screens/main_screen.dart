import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSection("Explore your feelings;", "We're here to hear", true),
            _buildImageSection1("Draw the feelings you ever know!", "We make emotional tags from your texts, such as joy, sadness, etc."),
            _buildImageSection2("Analyze your emotions deeply", "Find your emotions visually and statistically; You'll understand yourself better than ever."),
            _buildHowItWorksSection(),
            _buildEmotionAnalysisSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }
  Widget _buildHeader() {
   return Padding(
     padding: const EdgeInsets.all(20.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(
           "PSYCLeD",
           style: TextStyle(color: Colors.white, fontSize: 24),
         ),
         ElevatedButton(onPressed: () {}, child: Text("Get Started")),
       ],
     ),
   );
  }
  Widget _buildSection(String title, String subtitle, bool centerText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
          Text(
            title,
            textAlign: centerText ? TextAlign.center : TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textAlign: centerText ? TextAlign.center : TextAlign.left,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text("Get Started")),
        ],
      ),
    );
  }
  Widget _buildImageSection1(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        children: [
          Expanded(child: Image.asset("assets\images\pencil.png")),
          //사진 여기다 끼워넣음 될듯
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
  Widget _buildImageSection2(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        children: [
          Expanded(child: Image.asset("assets\images\computer.png")),
          //사진 여기다 끼워넣음 될듯
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  Widget _buildImageSection3(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        children: [
          Expanded(child: Image.asset("assets\images\pencil.png")),
          //사진 여기다 끼워넣음 될듯
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  Widget _buildImageSection4(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        children: [
          Expanded(child: Image.asset("assets\images\computer.png")),
          //사진 여기다 끼워넣음 될듯
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Text(
            "How it works",
            style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          _buildStep("Step 1", "Textmining", "PSYCLeD visually show the words you use frequently.", "assets\images\step1.png"),
          _buildStep("Step 2", "Frequency Table", "You can see what you said in every situations, and timeline.", "assets\images\step2.png"),
          _buildStep("Step 3", "Feedback", "If you recognized your feeling, get a productive feedback", "assets\images\step3.png"),
        ],
      ),
    );
  }
  Widget _buildStep(String step, String title, String description, String imagePath) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$step: $title",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildEmotionAnalysisSection() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            Text("One more Thing, PSYCLeD allows you to sense emotions in text.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            _buildImageSection3("Analyze your interviews", "Catch the emotions in conversations"),
            _buildImageSection4("Emotions in literary works can be analyzed", "you analyze emotions in poetry, too"),
          ],
        ),
    );
  }
  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Text(
            "Now, it's your turn",
            style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Get Started")
          ),
          SizedBox(height: 20),
          Text("PSYCLeD", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

