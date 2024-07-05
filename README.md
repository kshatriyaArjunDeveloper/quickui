## Welcome to quickui

As the name suggests it's a quickie for UI development.  
It will be easy, fast and you will enjoy it!

It simplifies the most commonly used widgets, methods, and use cases to build UI.

This package includes: 

**Modified standard widget of flutter**

*   [Container widget](#container_)
*   [Animated Container widget](#animatedContainer_)
*   [Padding widget](#padding_)

**Custom widgets commonly used**

*   [Image widget](#image_)

**Utility methods and extensions for**

*   [Text style](#textStyle_)
*   [System bar](#systemBar_)
*   [On click](#onClick_)

## Container\_ Widget

*   **Paddings** and **Margins**:
    *   No need to use _Edge Insets_, resulting in more readable and concise code.

        ```plaintext
        Container_(
          topPadding: 10, // leftPadding: 10, rightPadding: 10, bottomPadding: 10,
          verticalPadding: 20, // horizontalPadding: 10,
          allPadding: 30,
          allMargin: 40, // Fields named with same pattern for padding
          color: Colors.blueAccent,
          child: const Text(
        'Custom container',
          ),
        );
        ```

    *   Mix logic of values, Priority of values will be taken as _most specified > horizontal or vertical > all_

        Ex: Below container will have all sides `40` padding but the top padding will be `10`.

        ```plaintext
        Container_(
              topPadding: 10,
              allPadding: 40,
              color: Colors.blueAccent,
              child: const Text(
                'Custom container',
              ),
            );
        ```

*   **Rounded Corners**:
    *   Direclty give corner radius and mix it up by common and specified values as above.
    *   Ex: Below container will have all corner radius of `20`  but the top left corner radius will be `5`.

        ```plaintext
        Container_(
              topLeftRadius: 5, // topRightRadius, bottomLeftRadius, bottomRightRadius
              allCornerRadius: 20,
              color: Colors.blueAccent,
              child: const Text(
                'Custom container',
              ),
            );
        ```

*   **Borders**:
    *   Give border _**gradient**_, colour and width directly with an option to make borders outside.

        ```plaintext
        Container_(
           borderGradient: const LinearGradient(
             colors: [
               Colors.blueAccent,
               Colors.redAccent,
             ],
           ),
           // borderColor: Colors.blue,
           shouldMakeBorderOutside: true,
           borderWidth: 1,
           child: const Text(
             'Border container',
           ),
         );
        ```

*   **Styling**:
    *   Give _**gradient**_, shadows and make container circle shaped directly .
    *   You need to give `height` or `width` for circle radius.

        ```plaintext
        Container_(
              gradient: const LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.redAccent,
                ],
              ),
              boxShadowList: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              shouldMakeCircle: true,
              height: 200,
              child: const Center(
                child: Text(
                  'Styling container',
                ),
              ),
            );
        ```

*   **BG Image**:
    *   Directly add image as background in container with options to give alignment and fit.

        ```plaintext
        Container_(
              backgroundImageAssetName: 'asset/img_bg_auth_universal.png',
              backgroundImageAlignment: Alignment.topCenter,
              backgroundImageFit: BoxFit.cover,
              verticalPadding: 20,
              child: const Text(
                'Image container',
              ),
            );
        ```