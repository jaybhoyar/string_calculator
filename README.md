# String Calculator

A simple Ruby module for adding numbers from a string, supporting various delimiters and handling negative numbers.

## Setup
1. **Navigate to the project directory after cloning the repository.**

    ```bash
    cd 
    ```

2. **Run the following command to install dependencies.**

    ```bash
    bundle install
    ```

3. **Running Specs**

    Inside the `string_calculator` directory

    ```bash
    bundle exec rspec
    ```



## Basic Usage
You can use the StringCalculator module in your Ruby scripts or IRB sessions:
1. **Require the StringCalculator Module**:

   In your Ruby script or IRB session, require the `string_calculator.rb` file:

   ```ruby
   require_relative 'lib/string_calculator'
   ```

2. **Use the StringCalculator Module:**

    Once the module is required, you can use its `add` method to perform string addition operations:

    ```ruby
      # Example usage
      puts StringCalculator.add("")        # Output: 0
      puts StringCalculator.add("1")       # Output: 1
      puts StringCalculator.add("1,5")     # Output: 6
      puts StringCalculator.add("1\n2,3")  # Output: 6
      puts StringCalculator.add("//;\n1;2") # Output: 3
    ```

3. **Handling Exceptions:**

    If the input contains negative numbers, the `StringCalculator.add` method will raise an exception with an appropriate error message.


4. **Exiting IRB:**

    To exit IRB, simply type:

    ```ruby
    exit
    ```