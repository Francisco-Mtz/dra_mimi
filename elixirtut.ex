
# modules hold functions
defmodule M do
    def main do
        # receive input
        # name = IO.gets("What is your name? ") |> String.trim
        # Show in console
        # IO.puts "Hello #{name}" # string interpolation

        # data_stuff()
        # strings_stuff()
        # math_stuff()
        # comparison()
        # control()
        # tuples()
        # lists()
        # maps()
        # pattern_matching()
        # anonymous_function()
        # recursion()
        # looping()
        # enumerables()
        # list_comprehensions()
        # expection_handling()
        concurrency()
    end

    def data_stuff do
        my_int = 123
        my_float = 56.78


        IO.puts "Integer #{is_integer(my_int)}"
        IO.puts "float #{is_float(my_float)}"
        # Atom is a constant whose value is its own name
        IO.puts "Atom #{is_atom(:Pittsburgh)}" # true
        # For atom that have spaces
        IO.puts "Atom #{is_atom(:"New York")}" # true

        one_to_10 = 1..10 # range

    end

    def strings_stuff do
        my_str = "My sentence"
        # Check length of the string
        IO.puts "Length : #{String.length(my_str)}"
        # Concatenating
        longer_str = my_str <> " " <> "is longer"

        # printing variable
        IO.puts(longer_str)

        # value and data type equal
        IO.puts "Equal : #{"Egg" === "egg"}"

        # contain
        IO.puts "My is in the string?: #{String.contains?(my_str, "My")}"

        # first character
        IO.puts "First : #{String.first(my_str)}"

        # Character at index 4
        IO.puts "Index 4: #{String.at(my_str, 4)}"

        # start at 3, and i want 8 characters
        IO.puts "Substring : #{String.slice(my_str, 3, 8)}"

        IO.inspect String.split(longer_str, " ")

        IO.puts String.reverse(longer_str)
        IO.puts String.upcase(longer_str) # It doesnt change the string
        IO.puts String.downcase(longer_str)
        # First word capitalize
        IO.puts String.capitalize(longer_str) 

        # Pipe output from one to another
        4 * 10 |> IO.puts 

    end

    def math_stuff do
        IO.puts "5 + 4 = #{5+4}"
        IO.puts "5 - 4 = #{5-4}"
        IO.puts "5 * 4 = #{5*4}"
        IO.puts "5 / 4 = #{5/4}"
        IO.puts "5 div 4 = #{div(5,4)}"
        IO.puts "5 rem 4 = #{rem(5,4)}" # %
    end

    def comparison do
        # ----- COMPARISON -----
        IO.puts "4 == 4.0 : #{4 == 4.0}" # true
    
        # Checks for equality of value and type
        IO.puts "4 === 4.0 : #{4 === 4.0}"
    
        IO.puts "4 != 4.0 : #{4 != 4.0}" # false (they are "equal")
        IO.puts "4 != 4.0 : #{4 !== 4.0}" # true
    
        IO.puts "5 > 4 : #{5 > 4}" # true
        IO.puts "5 >= 4 : #{5 >= 4}" # true
        IO.puts "5 < 4 : #{5 < 4}" # false
        IO.puts "5 <= 4 : #{5 <= 4}" # false
    
        # Logical operators
        age = 16
        IO.puts "Vote & Drive : #{(age >= 16) and (age >= 18)}"
    
        IO.puts "Vote or Drive : #{(age >= 16) or (age >= 18)}"
    
        # Converts true to false vice versa
        IO.puts not true
    end

    def control do
        # ----- DECISION MAKING -----
        age = 16
        # If and Else
        if age >= 18 do
            IO.puts "Can Vote"
        else
            IO.puts "Can Wait"
        end
    
        # Unless
        unless age === 18 do # If the age is not equal to 18
            IO.puts "You're not 18"
        else
            IO.puts "You're 18"
        end
    
        # Cond works like else if
        # it only hits the 1st match and escapes
        cond do
            age >= 18 -> IO.puts "You can vote"
            age >= 14 -> IO.puts "You can wait"
            age >= 16 -> IO.puts "You can drive"
            true -> IO.puts "Default"
        end
    
        # Case works like switch 
        myVar = 2
        case myVar do
            1 -> IO.puts "Entered 1"
            2 -> IO.puts "Entered 2"
            _ -> IO.puts "Default"
        end
    
        # Ternary operator
        IO.puts "Ternary : #{if age > 18, do: "Can Vote", else: "Can't Vote"}"
    end

    def tuples do
        # Tuples normally have 2 to 4 values
        # They can hold any value
        # They aren't for enumerating, or
        # cycling through like lists
        # They are for pattern matching
    
        # Create a tuple
        my_stats = {175, 6.25, :Derek}

        # Check if is a tuple
        IO.puts "Tuple #{is_tuple(my_stats)}" # true
    
        # You can append values (to the end)
        my_stats2 = Tuple.append(my_stats, 42)
    
        # Retrieve values by index
        IO.puts "Age: #{elem(my_stats2, 3)}"
    
        # Get tuple size
        IO.puts "Size: #{tuple_size(my_stats2)}"
    
        # Everytime you modify the tuple, it creates a new one
        # Delete an index
        my_stats3 = Tuple.delete_at(my_stats2, 0)

        # Use inspect instead of puts (puts is for strings)
        IO.inspect my_stats3
    
        # Insert at an index (pushes the other ones)
        my_stats4 = Tuple.insert_at(my_stats3, 0, 1974)
        IO.inspect my_stats4

        # Create a tuple with the same values
        # duplicated a number of times
        many_zeroes = Tuple.duplicate(0, 5)
        IO.inspect many_zeroes # {0, 0, 0, 0, 0}
    
        # You can use tuples for pattern matching
        # like deestructuring
        {weight, height, name} = {175, 6.25, :Derek}
        IO.puts "Weight : #{weight}"
        IO.puts "Name is atom?: #{is_atom(name)}"
        IO.puts "Name: #{name}"
    end

    def lists do
            # ----- LISTS -----
        # They are also immutable
        # Lists contain lists of data of any data type
        # list1 = [1,2,3]
        # list2 = [4,5,6]
    
        # # You can combine Lists
        # list3 = list1 ++ list2
        # IO.inspect list3 # [1, 2, 3, 4, 5, 6]

        # # You can subtract Lists
        # list4 = list3 -- list1
        # IO.inspect list4 # [4, 5, 6]
    
        # # Verify if an item is in a list
        # IO.puts 6 in list4  # true
    
        # # Separate the head and tail of list
        # [head | tail] = list3
        # IO.puts "Head : #{head}"  # Head : 1
    
        # # Write to the screen without a newline
        # IO.write "Tail : " # Tail : [2, 3, 4, 5, 6]
    
        # # To show the tail use inspect
        # IO.inspect tail
    
        # Inspect which prints the internal
        # representation of a
        # value may give odd results
        # IO.inspect [97,98] # 'ab'
        # WTF
    
        # # You can force inspect to print as a list
        # # like this
        # IO.inspect [97,98], char_lists: :as_lists # [97,98] 'ab'
    
        # # Enum can enumerate over lists
        # Enum.each tail, fn item ->
        #     IO.puts item
        # end
    
        words = ["Random", "Words", "in a", "list"]
        # Enum.each words, fn word ->
        #     IO.puts word
        # end
    
        # We can use recursion to loop as well
        display_list(words)
        
        # The next 3 doesnt affect words
        # Delete deletes the given item from a list
        IO.puts display_list(List.delete(words,"Random"))
    
        # Delete item at index
        IO.puts display_list(List.delete_at(words,1))
    
        # Insert item at index
        IO.puts display_list(List.insert_at(words,4, "Yeah"))
    

        # Get first item
        IO.puts List.first(words)
    
        # Get last item
        IO.puts List.last(words)
    
        # You can create lists of key value tuples
        my_stats5 = [name: "Derek", height: 6.25, weight: 175]
        IO.inspect my_stats5

        # Get a certain element of a list
        IO.puts Enum.at(words, 2)

        # Appending to a list
        newWords = words ++ [4]
        IO.inspect newWords
        newerWords = List.delete(words, "Random")
        
        IO.inspect newerWords
    end

    # Each time it gets words, words get chop
    def display_list([word | words]) do 
        IO.puts word # The head
        display_list(words)
    end

    # do nothing
    def display_list([]), do: nil 

    def maps do
         # ----- MAPS -----
        # Maps hold collections of key value pairs
        capitals = %{"Alabama" => "Montgomery",
        "Alaska" => "Juneau", "Arizona" => "Phoenix"}
    
        # Retrieve values using the key
        IO.puts "Capital of Alaska is #{capitals["Alaska"]}"
    
        # You can use atoms as keys
        capitals2 = %{alabama: "Montgomery",
        alaska: "Juneau", arizona: "Phoenix"}
    
        IO.puts "Capital of Arizona is #{capitals2.arizona}"

        capitals3 = Dict.put_new(capitals, "Arkansas", "Little Rock")


    end

    def pattern_matching do
        # ----- PATTERN MATCHING -----
        # With pattern matching we can retrieve
        # data from data structures
    
        [length, width] = [20, 30]
        IO.puts "Width : #{width}" # Width: 30
    
        # If you don't care about data use _
        [_, [_, a]] = [20, [30, 40]]
        IO.puts "Get Num : #{a}" # Get Num : 40
    
       
    end

    def anonymous_function do
         # ----- ANONYMOUS FUNCTIONS -----
        # An anonymous function has no name and can
        # be passed to another function
        get_sum = fn (x, y) -> x + y end
        IO.puts "5 + 5 = #{get_sum.(5,5)}" # 5 + 5 = 10
    
        # # Shorthand of the above
        # # Increment the parameter names by 1
        get_less = &(&1 - &2)
        IO.puts "7 - 6 = #{get_less.(7,6)}" # 7 - 6 = 1
    
        # You can have functions except different
        # numbers of parameters
        add_sum = fn
        {x,y} -> IO.puts "#{x} + #{y} = #{x+y}"
        {x,y,z} -> IO.puts "#{x} + #{y} + #{z} = #{x+y+z}"
        end
    
        add_sum.({1,2})
        add_sum.({1,2,3})
    
        # # You can set defaults for parameters
        IO.puts do_it() # 3
    end

    # x = 1
    def do_it(x \\ 1, y \\ 2) do
        x + y
    end

    def recursion do
        IO.puts "Factorial of 4 : #{factorial(4)}"
    end

    def factorial(num) do
 
        # This will end the calling of
        # additional functions
        if num <= 1 do
          1
        else
            # recursion is like making a chain
          result = num * factorial(num - 1)
          result
        end
    end

    def looping do
        # With most languages we loop by
        # incrementing or decrementing a value
        # Since all variables are immutable
        # in Elixir we use recursion to loop

        # We want to sum all the values inside of a list
        IO.puts "Sum : #{sum([1,2,3])}" # 6
    
        # An Elixir for loop
        loop(5,1)
    end
    
    def sum([]), do: 0

    # If get !empty
    def sum([h|t]), do: h + sum(t)

    def loop(0, _), do: nil

    def loop(max, min) do
        if max < min do
            loop(0, min)
        else
            IO.puts "Num : #{max}"
            loop(max - 1, min)
        end
    end

    def enumerables do
        # data type that is going to allow its items to be counted off (ser contados)
        IO.puts "Even List : #{Enum.all?([1, 2, 3], 
        fn(n) -> rem(n, 2) == 0 end )}"

        IO.puts "Any of the elements is even : #{Enum.any?([1, 2, 3], 
        fn(n) -> rem(n, 2) == 0 end )}"

        # Show all the elements of a list
        Enum.each([1, 2, 3, 4], fn(n) -> IO.puts n end  )

        dbl_list = Enum.map([1,2,3], fn(n) -> n * 2 end  )

        # Sum all the values with reduce
        # The first time the accumulator is 0
        sum_vals = Enum.reduce([1, 2, 3], fn(n, accumulator) -> n + accumulator end)
        IO.puts "sum_vals: #{sum_vals}"
        
        # List with the unique values
        IO.inspect Enum.uniq([1, 2, 2, 4, 5, 6, 6])


    end

    

    def list_comprehensions do
        # ----- LIST COMPREHENSIONS -----
        # Provides an additonal way to perform
        # actions on a list
    
        # Double every list item
        dbl_list2 = for n <- [1,2,3], do: n * 2
        IO.inspect dbl_list2
    
        # Create a list of evens
        even_list = for n <- [1,2,3,4], rem(n,2) == 0, do: n
        IO.inspect even_list
    
    end

    def expection_handling do
        # ----- EXCEPTION HANDLING -----
        # Allows us to handle errors
    
        err = try do
            5 / 0
        rescue
            ArithmeticError -> "Can't Divide by Zero"
        end
        
        IO.puts err
    end

    def concurrency do
        # It means running multiple blocks of code at once

        # Calling spawn starts a new process that
        # runs the code specified at an undefined
        # time
    
        # Spawn returns a Process ID (PID)
        spawn(fn() -> loop(50, 1) end)
        spawn(fn() -> loop(100, 50) end)
    
        # We can send messgaes between
        # processes
    
        # Send a message to this process (to myself)
        # and receive it
        send(self(), {:french, "Bob"})
    
        receive do
            {:german, name} -> IO.puts "Guten tag #{name}"
            {:french, name} -> IO.puts "Bonjour #{name}"
            {:english, name} -> IO.puts "Hello #{name}"
    
        # If there is no matching message you can issue
        # a timeout like I did for 500 milliseconds
        after
            500 -> IO.puts "Times up"
        end
        
    end


end
