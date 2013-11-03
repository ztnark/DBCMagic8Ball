class Magic8BallViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    # labelFrame   = CGRectMake(10,60,300,80)
    view.image = UIImage.imageNamed('8ballbg.png')
    @label = makeLabel
    @title = makeTitle
    view.addSubview(@label)
    view.addSubview(@title)

    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'showAnswer')
    view.addGestureRecognizer(recognizer)

    @magicBall = Magic8Ball.new
  end

  def motionEnded(motion, withEvent:event)
    if (motion == UIEventSubtypeMotionShake)
      p "Shake Detected"
      self.showAnswer
    end
  end

  def showAnswer
    @label.text = @magicBall.randomAnswer
    @label.alpha = 0
    UIView.animateWithDuration(1.0,
                    animations:lambda {
                        @label.alpha = 1
                    })
  end

  def makeLabel
    labelFrame = [[10,60],[300,80]]
    label = UILabel.alloc.initWithFrame(labelFrame)
    label.backgroundColor = UIColor.colorWithRed(0.13,green:0.18, blue:0.33, alpha:1.0)
    label.font = UIFont.boldSystemFontOfSize(34)
    label.textColor = UIColor.darkGrayColor
    label.textAlignment = UITextAlignmentCenter
    label.text = "Tap for Answer!"
    label
  end

  def makeTitle
    labelFrame = [[10,490],[300,80]]
    label = UILabel.alloc.initWithFrame(labelFrame)
    label.font = UIFont.boldSystemFontOfSize(34)
    label.textColor = UIColor.darkGrayColor
    label.textAlignment = UITextAlignmentCenter
    label.text = "DBC Magic 8 Ball"
    label
  end
end
