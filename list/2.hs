myButLast :: [a] -> a
myButLast [] = error "Empty list"
myButLast [x] = error "List with only one element"
myButLast [x, _] = x
myButLast (_:xs) = myButLast xs

main = do
    print $ myButLast [1,2,3,4]
    print $ myButLast ['a'..'z']
    print $ myButLast [1]
