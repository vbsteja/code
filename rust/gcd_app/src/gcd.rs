fn gcd(mut n: u64,mut m: u64) -> u64 {
    assert!( n != 0 && m !=0 );
    while m !=0 {
        if m < n {
            let t = m; m = n; n = t;
        }
        m = m % n;
    }
    n
}
fn main(){
    gcd((1,2,3,4,5),(4,5,6,7))
}
