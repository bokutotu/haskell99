{-# LANGUAGE NoMonomorphismRestriction #-}

myLast :: [a] -> a
myLast [x] = x
myLast (_:xs) = myLast xs
myLast [] = error "Empty list"

-- foldrは右から畳み込む
-- foldr1は最後の要素を取り出す
-- constは第一引数を返す
-- idは引数をそのまま返す
-- const idがなぜ最後の要素を返すか
-- const id 1 2があるとすると、
-- haskellでは関数が最も優先されるので、
-- (const id 1) 2となる
-- id 2
-- となり、
-- 2
-- となる
myLast' = foldr1 (const id)

-- Prelude> const 1 2
-- 1
-- Prelude> (flip const) 1 2
-- 2
myLast'' = foldr1 (flip const)
-- myLast'' = foldr1 \x y -> y

myLast''' = head . reverse

myLast'''' = foldl1 (curry snd)

myLast''''' [] = error "No end for empty lists!"  
myLast''''' x = x !! (length x -1)

myLast'''''' = last 

main = do
    print $ myLast [1,2,3,4]
    print $ myLast ['x','y','z']
    print $ myLast'''''' [1,2,3,4]
