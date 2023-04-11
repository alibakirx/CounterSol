// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Calculator {
    //State variables hold the values

    uint256 public total;
    uint256 public subtracted;
    uint256 public multiplied;
    uint256 public divided;
    
    //Fonksiyonlarda gerekli şartların sağlanıp sağlanmadığını kontrol edip değerlere atıyoruz.
    function add(uint256 x,uint256 y) public{
        require(x+y >= x || x+y >= y, "Integer overflow"); // Değerlerin toplamı uint256'nın desteklediği max değerden de büyük olursa sonuç negatif çıkar, bu durumda hata mesajımız tetiklenir :)
        total = x + y;
        
    }

    function subtract(uint256 x, uint256 y) public {
        require(x >= y,"Result can not be negative!"); // İkince değer ilk değerden büyük olursa sonuç negatif olur hata mesajımız tetiklenir.
        subtracted = x - y;
    }
    function multiply(uint256 x, uint256 y) public {
        if(x==0 || y==0){ //iki değerden biri 0 ise multiplied değişkenini 0 yapıp sonlandırıyoruz.
            multiplied = 0;
        }
        else{
           require(x * y / x == y, "Integer Overflow ! "); // Sonuç uint256'nın desteklediği max değerden de büyük olursa x*y'nin değeri negatif olacağından paydaya bölümü negatif çıkar hata mesajı tetiklenir.
           multiplied = x * y;
        }

    }
    function divide(uint256 x, uint256 y) public {
        require(y != 0 ,"The denominator cannot be zero ! "); // payda sıfır olusa sonuç tanımsız olur hata mesajı tetiklenir.
        divided = x / y;

    }

    //Değişkenleri ayrı fonksiyonlarda çağırıp yazdırıyoruz.
    
    function getTotal() public view returns (uint256){
        return total;
    }

    
    function getSubtracted() public view returns (uint256){
        return subtracted;
    }

    
    function getMultiplied() public view returns (uint256){
        return multiplied;
    }

    
    function getDivided() public view returns (uint256){
        return divided;
    }
}
