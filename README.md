# BSYellowPages
An iOS customizable ScrollIndicator

![Image](DemoResources/demo1.gif)
![Image](DemoResources/demo2.gif)

### How to use
```objective-c
#import "BSYellowPagesView.h"
...
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet BSYellowPagesView *yellowPagesView;
...
[self.yellowPagesView createYellowPagesWithScrollView:self.scrollView];

```

### Customization with IB
![Image](DemoResources/customization1.png)
![Image](DemoResources/customization2.png)
