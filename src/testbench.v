`timescale 1ns / 1ps

module tb_mini_light_up_game;

    // =========================
    // Signaux
    // =========================
    reg clk;
    reg reset;
    reg btn;

    wire [6:0] segments;
    wire [3:0] digit_sel;

    // =========================
    // DUT (Device Under Test)
    // =========================
    mini_light_up_game uut (
        .clk(clk),
        .reset(reset),
        .btn(btn),
        .segments(segments),
        .digit_sel(digit_sel)
    );

    // =========================
    // Horloge (100 MHz)
    // =========================
    always #5 clk = ~clk;

    // =========================
    // Dump VCD (GTKWave)
    // =========================
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_mini_light_up_game);
        $dumpvars(1, uut); // optionnel mais utile
    end

    // =========================
    // Stimuli
    // =========================
    initial begin
        // Init
        clk = 0;
        reset = 1;
        btn = 0;

        // Reset
        #20;
        reset = 0;
        $display("Sortie du reset...");

        // Observation
        #100;

        // Test 1
        $display("Appui bouton - Test 1");
        btn = 1;
        #20;
        btn = 0;

        #200;

        // Test 2
        $display("Appui bouton - Test 2");
        btn = 1;
        #20;
        btn = 0;

        // Observation multiplexage
        $display("Observation affichage...");
        #1000;

        $display("Fin simulation");
        $finish;
    end

    // =========================
    // Monitoring console
    // =========================
    initial begin
        $monitor("t=%0t | digit_sel=%b | segments=%b | clk=%b",
                 $time, digit_sel, segments, clk);
    end

endmodule