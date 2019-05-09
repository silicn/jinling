//
//  SwiftViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/8.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var p = "你好"
        p = "nali"
        print(p,terminator:"你好\n")
        print(p, separator: "-", terminator: "弄好\n")
        
        //元组
        let http404Error = (404, "Not Found")
        let (code,message) = http404Error;
        print(code,message,"\n");
        
        let http200Error = (code:200,message:"OK")
        
        print(http200Error.code,http200Error.message);
        
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        print(convertedNumber as Any)
        
        // nil 标示固定的值:缺省 不表示空（NULL）
        if convertedNumber != nil {
            print("convertedNumber contains some integer value.")
        }
        //控制语句 for - in
        let names = ["a","b","c","d"];
        for name in names {
            print(name,"\t")
        }
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (name,age) in numberOfLegs {
            print("\(name) age is \(age)")
        }
        
        var i = 1
        while i < 10 {
            print("\(i)\t")
            i += 1
        }
        
        repeat {
            i += 1
            print("repat")
        } while i < 20 
        
        switch i {
        case 20:
            print("switch")
        default:
            print("default")
        }
        
        let someString = "Some string literal value"
        let quotation = """
                           In a storyboard-based application, you will often want to do a little preparation                      before navigation
                            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                            Get the new view controller using segue.destination

                         """
        let softWrappedQuotation = """
                                   The White Rabbit put on his spectacles.  "Where shall I begin, \
                                   please your Majesty?" he asked.

                                   "Begin at the beginning," the King said gravely, "and go on \
                                   till you come to the end; then stop."
                                   """
        print(someString,quotation,softWrappedQuotation)
        
        let strinr1 = "hello"
        let string2 = " world"
        
        let string3 = strinr1 + string2
        
        print(string3)
        
        var string4 = "beigin "
        
        string4 += string3
        
        print(string4)
        
        // 数组
        var shoppingList:Array = ["egg","apple"]
        
        print("shoppinglist have \(shoppingList.count) kind things")
        
        shoppingList.append("orangle")
        
        print("shoppinglist have \(shoppingList.count) kind things")
        
        print(shoppingList)
        
        shoppingList.removeAll()
        
        if shoppingList.isEmpty {
            print("shoppinglist is empty")
        }
        
        shoppingList.append("Flout")
        
        shoppingList += ["Cheese"]
        
        shoppingList += ["Butter","Chocolate"]
        
        print(shoppingList)
        
        let firstItem = shoppingList[0]
        
        print(firstItem)
        
        shoppingList[1...3] = ["zaima","buzhi","shenme"]
        
        print(shoppingList)
        
        shoppingList.insert("insert", at: 1)
        
        let stringMap =  shoppingList.map { (str) -> String in
            print("map = \(str)")
            var string  = String(str)
            string.append("map")
            return string;
        }
        
        print("map == \(stringMap) map\n")
        
        print(shoppingList)
        
        let map = shoppingList.remove(at: 2)
        
        print(map)
        
        print(shoppingList)
        
        for item in shoppingList {
            print(item)
        }
        
        for (index,item) in shoppingList.enumerated() {
            print("item \(index) is \(item)")
        }
        
        // 集合
        var letters = Set<Character>()
        
        letters.insert("a")
        
        var genres :Set<String> = ["xiaoming","xiaohua","xiaohong"]
        
        print("i have \(genres.count) favourites")
        
        genres.insert("xiaoli")
        
        var  A:Set<String> = ["A", "B", "C", "D"]
        let  B:Set<String> = ["C", "D", "E", "F"]
        let  C:Set<String> = ["B", "B", "C"]
        A.insert("E")
        
        
        // 并集 (A∪B)
        let set1 =  A.union(B)
        print(set1);
        
        //交集
        let set2 = A.intersection(B);
        
        print(set2,B);
        
        //交外集合
        let set3 = A.symmetricDifference(B)
        
        print(set3)
        
        // 是否是子集
        print(C.isSubset(of: A))
        
        print(A.isSuperset(of: B))
        
        print(C)
        
        //字典
        
        var dic:[String:String] = ["a":"xiaoming","b":"xiaohua","c":"xiaoli"]
        
        print("dic contains \(dic.count) object")
        
        dic.map { (key,value) -> (String,String) in
            print("the map is \(key) \(value)")
            return (key,value)
        };
        
        dic["d"] = "xiaozhang";
        
        print(dic)
        
        for (key,value) in dic {
            print("the key is \(key) and the value is \(value)")
        }
        
        //函数
        
        func greet(str:String)->String{
            return str + " ,你好"
        }
        
        print(greet(str: "小明"))
        
        func greet_no_param()->String{
            return "没有参数的函数"
        }
        
        print(greet_no_param())
        
        func greet_no_return(name:String){
            print("\(name) greet_no_return func")
        }
        greet_no_return(name:"小花")
        
        func minMax(arr:[Int]) -> (min:Int,max:Int)?{
            if  arr.isEmpty {return nil}
            var c_min = arr[0]
            var c_max = arr[0]
            for value in arr[1..<arr.count] {
                if value < c_min{
                    c_min = value
                }
                if value > c_max{
                    c_max = value
                }
            }
            
            return (c_min,c_max)
        }
        
        let result =  minMax(arr: [2,1,3,5,7,4,8])
        
        print(result?.min ?? 0,result?.max ?? 0)
        
        //可变参数,一个函数最多只能拥有一个可变参数。
        
        func add(_ numbes:Int...)->Int{
            var sum = 0;
            for num in numbes{
                sum += num;
            }
            return sum;
        }
        
        print(" sum = \(add(1,1,2)),sum = \(add(2,3,4))")
        
        func addTwoInts(_ a: Int, _ b: Int) -> Int {
            return a + b
        }
        
        func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
            return a * b
        }
        var mathFunc:(Int,Int)->Int = addTwoInts
        
        print(mathFunc(2,3))
        
        mathFunc = multiplyTwoInts;
        
        print(mathFunc(2,3))
        
        //函数作为返回类型
        func stepForward(_ input: Int) -> Int {
            return input + 1
        }
        func stepBackward(_ input: Int) -> Int {
            return input - 1
        }
        
        func chooseFunc(backWord:Bool) -> (Int)->Int{
            return backWord ? stepBackward :stepForward
        }
        
        var c_value = -3
        //moveTozero 是个函数
        let moveToZero = chooseFunc(backWord: c_value > 0)
        
        while c_value != 0 {
            c_value = moveToZero(c_value)
            print("current value is \(c_value)")
        }
        
        
        func chooseFuncStep(backWord:Bool)->(Int)->Int{
            func stepForward(input: Int) -> Int {
                return input + 1
            }
            func stepBackward(input: Int) -> Int {
                return input - 1
            } 
            return backWord ? stepBackward :stepForward
        }
        
        // 闭包
        
        let names1 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 < s2
        }
        let names2 = names1.sorted(by: backward)
        print(names2)
        
        let names3 = names1.sorted { (s1, s2) -> Bool in
            return s1 < s2
        }
        print(names3)
        
        let names4 = names1.sorted(by: {s1,s2 in s1 < s2})
        print(names4)
        
        let names5 = names1.sorted(by: <)
        
        print(names5)
        
        //尾随闭包
        func someFuncClosure(closure:()->Void){
            print("someFuncClosure")
        }
        
        someFuncClosure() {
        }
        
        someFuncClosure(closure: {
        })
        
        let names6 = names1.sorted{ $0 < $1}
        print(names6)
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let string = numbers.map {
            (number) -> String  in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        
        print(string)
        
        
        func makeIncrementer(forIncrement amount:Int)->()->Int{
            var runningTotal = 0;
            func incrementer()->Int{
                runningTotal += amount;
                return runningTotal;
            }
            return incrementer
        }
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        var increment = incrementByTen()
        print(increment)
        increment = incrementByTen()
        print(increment)
        increment = incrementByTen()
        print(increment)
        
        func addSelf(amount:Int)-> ()->Int{
            var total = 0;
            func add()->Int{
                total += amount;
                return total;
            }
            return add
        }
        
        
        //函数
        let totalFunc = addSelf(amount: 10);
        
        var total = totalFunc()
        
        total = totalFunc()
        
        print(total)
        
        // 逃逸闭包
        
        var completionHandlers:[()->Void] = []
        
        func someFunctionWithEscapingClosure(completionHandle:@escaping()->Void){
            completionHandlers.append(completionHandle)
        }
        
        func someFunctionWithNoEscapingClosure(closure:()->Void){
            closure()
        }
        
        var x = 10
        
        func doSomething(){
            someFunctionWithNoEscapingClosure {
                x = 10;
            }
            
            someFunctionWithEscapingClosure { 
                x = 20
            }
        }
        
        print(doSomething())
        
        //枚举
        
        enum CompassPoint{
            case north 
            case south 
            case east 
            case west 
        }
        
        
        var dirctionToHead = CompassPoint.west
        
        dirctionToHead = .east
        
        switch dirctionToHead {
        case .north:
            print("north")
        case.east:
            print("east")
        default:
            print("default")
        }
        
        
        
        
        
        
        
        
        //
        
        //        print(set2)
        
        //        // 交集 (A∩B)
        //        A.intersect(B)
        //        A.intersectInPlace(B)
        //        // 输出
        //        Set A: ["C", "D"]
        //        
        //        // 异或 (A^B)
        //        A.exclusiveOr(B)
        //        A.exclusiveOrInPlace(B)
        //        // 输出
        //        Set A: ["A", "B", "E", "F"]
        //        
        //        // C 是否是 A 的子集
        //        C.isSubsetOf(A)
        //        // A 是否是 C 的超集
        //        A.isSupersetOf(C)
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
