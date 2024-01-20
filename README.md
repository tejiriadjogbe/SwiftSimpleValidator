
# SimpleValidator

'SimpleValidator' is a lightweight Swift library designed to simplify the process of validating text input in iOS applications. With a collection of pre-defined validation rules and extensible custom rules, this library makes it easy to validate various types of user input, such as emails, phone numbers, passwords, and more.


## Usage

SimpleValidator comes with default rules for some common validations, you can also create your own custom rules.

```swift
@IBAction func proceedTapped(_ sender: Any) {
  if isInputValid() {
    //Carry out action
  }
}

func isInputValid() -> bool {
  let rules = [
            Rule(.isEmpty, message: "Enter a value"),
            Rule(.isDigit, message: "Enter numbers only"),
            Rule(.custom { userAge >= 18 }, message: "age cannot be less than 18")
        ]

  return SimpleValidator.validate(rules: rules, candidates: [ValidationCandidate(text: textField.text ?? "", errorLabel: errorLabel)])
}
```

### Using UITextFileds
Working with UITextFileds is way easier, you can simply just call the validate function on the field to validate its input. 

```swift
  func isInputValid() -> bool {
    let isPhoneValid = phoneField.validate(rules: rules, errorLabel: phoneErrorLabel)
    let isNameValid = nameField.validate(rules: rules, errorLabel: nameErrorLabel)
    let isEmailValidd = emailField.validate(rules: rules, errorLabel: emailErrorLabel)

    return isPhoneValid && isNameValid && isEmailValid
  }
```

### Creating Custom Validation Fields
If you have a custom views in your code that accepts input, with an error label to display validation errors, you can add a validate function to the custom view to make validating easy. 

```swift
public class ImageUploaderView: UIView { 
  @IBOutlet weak var errorLabel: UILabel!
  
  var imgBase64: String?

  // Rest of your custom view code

  func validate(rules: [Rule]) -> Bool {
        return SimpleValidator.validate(rules: rules, candidates: [ValidationCandidate(text: imgBase64 ?? "", errorLabel: errorLabel)])
    } 
}
```

Now just like the case of the case of UITextFileds, ImageUploaderView can now be validated easily.

```swift
  func isInputValid() -> bool {
    let isProfileImageValid = profileImageField.validate(rules: [Rule(.isEmpty, message: "Enter a value")])

    return isProfileImageValid
  }
```

### Custom Rules
You can take advantage of the default rules that comes with this library, execute custom fuctions with the .custom() rule or evaluate a regex string with the .regex rule.

If these does not completely cater for your usecase, you can create your own rules and use them with SimpleValidator.

```swift
public enum CustomRules: ValidatorRule {
    case customValidation1
    case customValidation2
    
    public func validate(_ text: String) -> Bool {
        switch self {
        case .customValidation1:
            return evaluateCustomValidation1(text)
        case .customValidation2:
            return evaluateCustomValidation2(text)
        }
    }
    
    func evaluateCustomValidation1(_ input: String) -> Bool {
        //Custom Validation Code
    }
        
    func evaluateCustomValidation2(_ input: String) -> Bool {
        //Custom Validation Code
    }
}
```

Your can now use your custom rules for validation

```swift
  func isInputValid() -> bool {
SimpleValidator.validate(rules: [
            Rule(CustomRules.customValidation1, message: "Error message"),
            Rule(CustomRules.customValidation2, message: "Error message")
            ],
            candidates: [ValidationCandidate(text: textField.text ?? "", errorLabel: errorLabel)])
  }
```
