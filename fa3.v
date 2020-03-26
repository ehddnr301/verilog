module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output count
);

    wire w1, w2, w3;

    and( w1, a, b );
    and( w2, a, cin );
    and( w3, b, cin );
    or( cout, w1, w2, w3 );

    xor( s, a, b, cin );

endmodule