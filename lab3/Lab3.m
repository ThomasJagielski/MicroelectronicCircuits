%% Experiment 1
Experiment_1 = load('Experiment_1.mat');
Experiment_1.Ib = fliplr(Experiment_1.Ib);
Experiment_1.Ie = fliplr(Experiment_1.Ie);
Experiment_1.Vb = fliplr(Experiment_1.Vb);

%% Experiment 2
Experiment_2_200 = load('Experiment_2-200.mat');
Experiment_2_200.Ib = fliplr(Experiment_2_200.Ib);
Experiment_2_200.Ie = fliplr(Experiment_2_200.Ie);
Experiment_2_200.Vb = fliplr(Experiment_2_200.Vb);

Experiment_2_2k = load('Experiment_2-2k.mat');
Experiment_2_2k.Ib = fliplr(Experiment_2_2k.Ib);
Experiment_2_2k.Ie = fliplr(Experiment_2_2k.Ie);
Experiment_2_2k.Vb = fliplr(Experiment_2_2k.Vb);

Experiment_2_20k = load('Experiment_2-20k.mat');
Experiment_2_20k.Ib = fliplr(Experiment_2_20k.Ib);
Experiment_2_20k.Ie = fliplr(Experiment_2_20k.Ie);
Experiment_2_20k.Vb = fliplr(Experiment_2_20k.Vb);


%% Experiment 3
Experiment_3 = load('Experiment_3-20k.mat');
Experiment_3.Ib = fliplr(Experiment_3.Ib);
Experiment_3.Vb = fliplr(Experiment_3.Vb);
Experiment_3.Ve = fliplr(Experiment_3.Ve);


%% Experiment 4
Experiment_4_51k = load('Experiment_4-51k.mat');
Experiment_4_51k.Ib = fliplr(Experiment_4_51k.Ib);
Experiment_4_51k.Vb = fliplr(Experiment_4_51k.Vb);
Experiment_4_51k.Vout = fliplr(Experiment_4_51k.Vout);

Experiment_4_60k = load('Experiment_4-60k.mat');
Experiment_4_60k.Ib = fliplr(Experiment_4_60k.Ib);
Experiment_4_60k.Vb = fliplr(Experiment_4_60k.Vb);
Experiment_4_60k.Vout = fliplr(Experiment_4_60k.Vout);

Experiment_4_71k = load('Experiment_4-71k.mat');
Experiment_4_71k.Ib = fliplr(Experiment_4_71k.Ib);
Experiment_4_71k.Vb = fliplr(Experiment_4_71k.Vb);
Experiment_4_71k.Vout = fliplr(Experiment_4_71k.Vout);
