require 'rails_helper'

RSpec.describe Day13 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }

  context 'when 1 example' do
    let(:example) do
      'Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279'.split("\n")
    end

    before do
      allow(task_input_fetcher_double).to receive(:call).and_return(example)
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 480
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 875318608908
    end
  end

  context 'when 2 example' do
    let(:example) do
      'Button A: X+43, Y+21
Button B: X+16, Y+31
Prize: X=6735, Y=9135

Button A: X+52, Y+55
Button B: X+69, Y+11
Prize: X=2798, Y=1100

Button A: X+13, Y+32
Button B: X+68, Y+24
Prize: X=8243, Y=3816

Button A: X+97, Y+34
Button B: X+72, Y+97
Prize: X=5459, Y=6291

Button A: X+66, Y+14
Button B: X+81, Y+77
Prize: X=5910, Y=3766

Button A: X+65, Y+77
Button B: X+82, Y+24
Prize: X=8533, Y=3599

Button A: X+63, Y+47
Button B: X+16, Y+39
Prize: X=852, Y=798

Button A: X+55, Y+26
Button B: X+25, Y+43
Prize: X=7660, Y=5943

Button A: X+67, Y+24
Button B: X+16, Y+39
Prize: X=14214, Y=10004

Button A: X+48, Y+15
Button B: X+27, Y+74
Prize: X=18569, Y=15096

Button A: X+21, Y+47
Button B: X+35, Y+14
Prize: X=5744, Y=8521

Button A: X+17, Y+52
Button B: X+45, Y+24
Prize: X=8468, Y=6452

Button A: X+21, Y+46
Button B: X+46, Y+29
Prize: X=8178, Y=8364

Button A: X+27, Y+11
Button B: X+15, Y+37
Prize: X=11861, Y=1287

Button A: X+17, Y+67
Button B: X+61, Y+21
Prize: X=12721, Y=12321

Button A: X+44, Y+11
Button B: X+11, Y+74
Prize: X=6249, Y=12411

Button A: X+43, Y+32
Button B: X+13, Y+53
Prize: X=2683, Y=5636

Button A: X+20, Y+71
Button B: X+62, Y+19
Prize: X=5542, Y=7049

Button A: X+65, Y+74
Button B: X+81, Y+12
Prize: X=5962, Y=6226

Button A: X+45, Y+78
Button B: X+71, Y+28
Prize: X=4747, Y=5186

Button A: X+32, Y+13
Button B: X+24, Y+54
Prize: X=10280, Y=15794

Button A: X+40, Y+15
Button B: X+15, Y+46
Prize: X=3525, Y=1689

Button A: X+98, Y+30
Button B: X+15, Y+24
Prize: X=10374, Y=4806

Button A: X+84, Y+37
Button B: X+11, Y+52
Prize: X=6398, Y=13946

Button A: X+20, Y+63
Button B: X+74, Y+28
Prize: X=7852, Y=19121

Button A: X+56, Y+21
Button B: X+41, Y+77
Prize: X=4084, Y=2755

Button A: X+24, Y+66
Button B: X+76, Y+48
Prize: X=3704, Y=4068

Button A: X+23, Y+91
Button B: X+59, Y+21
Prize: X=840, Y=1624

Button A: X+55, Y+13
Button B: X+58, Y+66
Prize: X=6299, Y=2953

Button A: X+72, Y+37
Button B: X+11, Y+47
Prize: X=5838, Y=5729

Button A: X+11, Y+25
Button B: X+47, Y+13
Prize: X=8669, Y=3911

Button A: X+91, Y+12
Button B: X+41, Y+54
Prize: X=3844, Y=4200

Button A: X+54, Y+30
Button B: X+27, Y+93
Prize: X=4050, Y=2562

Button A: X+37, Y+95
Button B: X+78, Y+30
Prize: X=5333, Y=2455

Button A: X+56, Y+23
Button B: X+15, Y+29
Prize: X=1544, Y=3765

Button A: X+87, Y+63
Button B: X+14, Y+52
Prize: X=2565, Y=1983

Button A: X+50, Y+38
Button B: X+29, Y+80
Prize: X=5011, Y=4330

Button A: X+20, Y+41
Button B: X+72, Y+48
Prize: X=14876, Y=8483

Button A: X+29, Y+79
Button B: X+62, Y+36
Prize: X=7841, Y=8469

Button A: X+13, Y+38
Button B: X+49, Y+31
Prize: X=19090, Y=10498

Button A: X+12, Y+23
Button B: X+57, Y+35
Prize: X=5882, Y=2769

Button A: X+11, Y+38
Button B: X+99, Y+13
Prize: X=8261, Y=4192

Button A: X+76, Y+11
Button B: X+18, Y+81
Prize: X=7206, Y=12859

Button A: X+11, Y+19
Button B: X+49, Y+27
Prize: X=17371, Y=8949

Button A: X+79, Y+11
Button B: X+56, Y+67
Prize: X=4535, Y=4006

Button A: X+12, Y+72
Button B: X+71, Y+14
Prize: X=2014, Y=10012

Button A: X+16, Y+45
Button B: X+79, Y+44
Prize: X=12630, Y=18535

Button A: X+49, Y+81
Button B: X+43, Y+14
Prize: X=4881, Y=4550

Button A: X+25, Y+37
Button B: X+34, Y+12
Prize: X=3249, Y=1513

Button A: X+45, Y+19
Button B: X+24, Y+41
Prize: X=17765, Y=8489

Button A: X+25, Y+54
Button B: X+49, Y+20
Prize: X=2186, Y=1374

Button A: X+40, Y+64
Button B: X+48, Y+18
Prize: X=12328, Y=17404

Button A: X+32, Y+81
Button B: X+96, Y+12
Prize: X=10112, Y=4575

Button A: X+50, Y+16
Button B: X+25, Y+75
Prize: X=7275, Y=12885

Button A: X+59, Y+35
Button B: X+17, Y+33
Prize: X=14681, Y=10785

Button A: X+86, Y+20
Button B: X+34, Y+55
Prize: X=4002, Y=1590

Button A: X+63, Y+27
Button B: X+14, Y+59
Prize: X=9258, Y=11796

Button A: X+97, Y+15
Button B: X+52, Y+67
Prize: X=6716, Y=4694

Button A: X+36, Y+62
Button B: X+29, Y+16
Prize: X=6269, Y=19412

Button A: X+67, Y+92
Button B: X+86, Y+30
Prize: X=11973, Y=10010

Button A: X+37, Y+11
Button B: X+16, Y+29
Prize: X=9451, Y=6864

Button A: X+31, Y+15
Button B: X+52, Y+85
Prize: X=1721, Y=1850

Button A: X+66, Y+13
Button B: X+25, Y+65
Prize: X=11765, Y=13705

Button A: X+80, Y+79
Button B: X+21, Y+79
Prize: X=4397, Y=7663

Button A: X+57, Y+26
Button B: X+22, Y+85
Prize: X=6688, Y=8748

Button A: X+73, Y+44
Button B: X+19, Y+48
Prize: X=19153, Y=19588

Button A: X+13, Y+55
Button B: X+71, Y+23
Prize: X=1126, Y=1990

Button A: X+72, Y+68
Button B: X+95, Y+11
Prize: X=5091, Y=3155

Button A: X+49, Y+16
Button B: X+25, Y+35
Prize: X=3805, Y=2960

Button A: X+43, Y+98
Button B: X+90, Y+25
Prize: X=9144, Y=4089

Button A: X+48, Y+34
Button B: X+23, Y+99
Prize: X=3414, Y=9862

Button A: X+44, Y+19
Button B: X+22, Y+56
Prize: X=4456, Y=12030

Button A: X+52, Y+77
Button B: X+30, Y+11
Prize: X=15458, Y=15566

Button A: X+38, Y+11
Button B: X+12, Y+63
Prize: X=1488, Y=6951

Button A: X+37, Y+11
Button B: X+33, Y+61
Prize: X=19386, Y=8652

Button A: X+92, Y+45
Button B: X+25, Y+50
Prize: X=10591, Y=7560

Button A: X+28, Y+64
Button B: X+32, Y+12
Prize: X=19208, Y=3964

Button A: X+70, Y+15
Button B: X+87, Y+98
Prize: X=10080, Y=7715

Button A: X+14, Y+96
Button B: X+16, Y+19
Prize: X=2168, Y=8607

Button A: X+13, Y+24
Button B: X+29, Y+11
Prize: X=12908, Y=10796

Button A: X+42, Y+82
Button B: X+53, Y+11
Prize: X=17947, Y=18345

Button A: X+61, Y+89
Button B: X+84, Y+34
Prize: X=3732, Y=3054

Button A: X+47, Y+17
Button B: X+11, Y+36
Prize: X=7924, Y=3034

Button A: X+73, Y+48
Button B: X+37, Y+85
Prize: X=7580, Y=7957

Button A: X+81, Y+14
Button B: X+98, Y+88
Prize: X=16336, Y=9148

Button A: X+16, Y+33
Button B: X+98, Y+42
Prize: X=5502, Y=2541

Button A: X+35, Y+68
Button B: X+34, Y+12
Prize: X=13091, Y=11496

Button A: X+14, Y+51
Button B: X+76, Y+27
Prize: X=1156, Y=19262

Button A: X+14, Y+36
Button B: X+63, Y+16
Prize: X=8866, Y=17172

Button A: X+51, Y+21
Button B: X+23, Y+60
Prize: X=10550, Y=10004

Button A: X+12, Y+30
Button B: X+67, Y+29
Prize: X=5496, Y=10066

Button A: X+13, Y+34
Button B: X+58, Y+42
Prize: X=19589, Y=8546

Button A: X+21, Y+59
Button B: X+51, Y+25
Prize: X=7853, Y=12783

Button A: X+79, Y+90
Button B: X+62, Y+12
Prize: X=6111, Y=6786

Button A: X+83, Y+13
Button B: X+23, Y+39
Prize: X=7289, Y=1885

Button A: X+58, Y+27
Button B: X+17, Y+39
Prize: X=15652, Y=10325

Button A: X+88, Y+45
Button B: X+19, Y+42
Prize: X=2197, Y=1866

Button A: X+69, Y+11
Button B: X+16, Y+81
Prize: X=5910, Y=3531

Button A: X+19, Y+44
Button B: X+22, Y+11
Prize: X=10669, Y=3510

Button A: X+15, Y+80
Button B: X+97, Y+72
Prize: X=2315, Y=3440

Button A: X+69, Y+82
Button B: X+66, Y+18
Prize: X=8115, Y=7710

Button A: X+45, Y+23
Button B: X+15, Y+55
Prize: X=5025, Y=6071

Button A: X+39, Y+15
Button B: X+19, Y+30
Prize: X=6986, Y=13580

Button A: X+60, Y+25
Button B: X+20, Y+61
Prize: X=7420, Y=12209

Button A: X+11, Y+56
Button B: X+69, Y+31
Prize: X=6917, Y=7105

Button A: X+23, Y+37
Button B: X+52, Y+19
Prize: X=6106, Y=4004

Button A: X+20, Y+58
Button B: X+70, Y+31
Prize: X=7630, Y=8379

Button A: X+53, Y+24
Button B: X+16, Y+54
Prize: X=4891, Y=6750

Button A: X+52, Y+20
Button B: X+12, Y+49
Prize: X=15128, Y=3793

Button A: X+98, Y+16
Button B: X+29, Y+34
Prize: X=10277, Y=3346

Button A: X+12, Y+24
Button B: X+28, Y+17
Prize: X=14900, Y=5123

Button A: X+62, Y+30
Button B: X+25, Y+48
Prize: X=6961, Y=398

Button A: X+18, Y+29
Button B: X+33, Y+13
Prize: X=899, Y=17953

Button A: X+82, Y+29
Button B: X+28, Y+94
Prize: X=7116, Y=3694

Button A: X+13, Y+67
Button B: X+44, Y+15
Prize: X=17930, Y=1539

Button A: X+11, Y+79
Button B: X+66, Y+46
Prize: X=2497, Y=2525

Button A: X+91, Y+34
Button B: X+21, Y+47
Prize: X=3892, Y=2433

Button A: X+36, Y+14
Button B: X+36, Y+70
Prize: X=15812, Y=11526

Button A: X+66, Y+24
Button B: X+21, Y+63
Prize: X=9731, Y=8597

Button A: X+67, Y+17
Button B: X+15, Y+59
Prize: X=2779, Y=3199

Button A: X+38, Y+12
Button B: X+22, Y+74
Prize: X=5802, Y=7362

Button A: X+57, Y+30
Button B: X+18, Y+46
Prize: X=16124, Y=8992

Button A: X+13, Y+54
Button B: X+78, Y+42
Prize: X=6435, Y=5298

Button A: X+11, Y+29
Button B: X+78, Y+45
Prize: X=12589, Y=7519

Button A: X+48, Y+29
Button B: X+21, Y+51
Prize: X=14339, Y=12317

Button A: X+12, Y+66
Button B: X+96, Y+37
Prize: X=2076, Y=6508

Button A: X+49, Y+82
Button B: X+95, Y+46
Prize: X=8784, Y=7808

Button A: X+14, Y+65
Button B: X+44, Y+12
Prize: X=9392, Y=10074

Button A: X+27, Y+82
Button B: X+71, Y+52
Prize: X=9077, Y=12186

Button A: X+25, Y+12
Button B: X+19, Y+31
Prize: X=2732, Y=3851

Button A: X+64, Y+17
Button B: X+48, Y+83
Prize: X=6960, Y=5572

Button A: X+11, Y+68
Button B: X+39, Y+13
Prize: X=3654, Y=10406

Button A: X+26, Y+53
Button B: X+42, Y+15
Prize: X=11440, Y=15652

Button A: X+19, Y+41
Button B: X+37, Y+14
Prize: X=8177, Y=9083

Button A: X+33, Y+45
Button B: X+94, Y+40
Prize: X=5578, Y=3550

Button A: X+93, Y+15
Button B: X+26, Y+45
Prize: X=4456, Y=1290

Button A: X+15, Y+57
Button B: X+75, Y+17
Prize: X=5165, Y=10327

Button A: X+47, Y+17
Button B: X+18, Y+65
Prize: X=18606, Y=16972

Button A: X+57, Y+83
Button B: X+78, Y+14
Prize: X=7539, Y=7393

Button A: X+29, Y+47
Button B: X+82, Y+29
Prize: X=5318, Y=3424

Button A: X+47, Y+35
Button B: X+36, Y+84
Prize: X=1306, Y=2002

Button A: X+58, Y+23
Button B: X+31, Y+59
Prize: X=4304, Y=293

Button A: X+99, Y+22
Button B: X+27, Y+98
Prize: X=6813, Y=8874

Button A: X+53, Y+12
Button B: X+23, Y+76
Prize: X=17141, Y=5516

Button A: X+54, Y+20
Button B: X+36, Y+68
Prize: X=3294, Y=4008

Button A: X+65, Y+22
Button B: X+20, Y+59
Prize: X=4075, Y=2685

Button A: X+29, Y+42
Button B: X+28, Y+13
Prize: X=5621, Y=12357

Button A: X+22, Y+51
Button B: X+32, Y+11
Prize: X=10008, Y=9754

Button A: X+76, Y+19
Button B: X+14, Y+49
Prize: X=2980, Y=9883

Button A: X+73, Y+20
Button B: X+15, Y+50
Prize: X=17293, Y=6120

Button A: X+20, Y+87
Button B: X+87, Y+85
Prize: X=7424, Y=11166

Button A: X+56, Y+28
Button B: X+13, Y+51
Prize: X=16114, Y=9490

Button A: X+99, Y+47
Button B: X+39, Y+62
Prize: X=7644, Y=7847

Button A: X+14, Y+42
Button B: X+72, Y+11
Prize: X=6470, Y=1985

Button A: X+50, Y+14
Button B: X+16, Y+63
Prize: X=17812, Y=8208

Button A: X+21, Y+45
Button B: X+56, Y+35
Prize: X=10693, Y=14380

Button A: X+17, Y+68
Button B: X+52, Y+15
Prize: X=14292, Y=5400

Button A: X+72, Y+19
Button B: X+15, Y+71
Prize: X=16883, Y=2971

Button A: X+17, Y+55
Button B: X+77, Y+39
Prize: X=15479, Y=5409

Button A: X+70, Y+38
Button B: X+17, Y+44
Prize: X=9069, Y=7614

Button A: X+25, Y+53
Button B: X+47, Y+28
Prize: X=12567, Y=17929

Button A: X+14, Y+72
Button B: X+65, Y+13
Prize: X=3787, Y=6419

Button A: X+49, Y+98
Button B: X+69, Y+12
Prize: X=7430, Y=8182

Button A: X+46, Y+95
Button B: X+51, Y+24
Prize: X=4212, Y=5283

Button A: X+80, Y+11
Button B: X+36, Y+47
Prize: X=5416, Y=997

Button A: X+85, Y+28
Button B: X+22, Y+46
Prize: X=1857, Y=1038

Button A: X+14, Y+37
Button B: X+65, Y+22
Prize: X=7794, Y=6607

Button A: X+85, Y+14
Button B: X+69, Y+96
Prize: X=10287, Y=6180

Button A: X+56, Y+13
Button B: X+28, Y+59
Prize: X=2048, Y=7544

Button A: X+13, Y+39
Button B: X+49, Y+28
Prize: X=7351, Y=13456

Button A: X+26, Y+95
Button B: X+80, Y+31
Prize: X=8046, Y=10846

Button A: X+35, Y+75
Button B: X+97, Y+35
Prize: X=5153, Y=5165

Button A: X+16, Y+86
Button B: X+63, Y+58
Prize: X=2250, Y=5920

Button A: X+96, Y+25
Button B: X+22, Y+22
Prize: X=10888, Y=4072

Button A: X+61, Y+13
Button B: X+70, Y+98
Prize: X=5028, Y=3564

Button A: X+20, Y+71
Button B: X+69, Y+53
Prize: X=6913, Y=9761

Button A: X+12, Y+27
Button B: X+49, Y+35
Prize: X=1505, Y=9830

Button A: X+54, Y+22
Button B: X+24, Y+46
Prize: X=18530, Y=1678

Button A: X+16, Y+50
Button B: X+66, Y+24
Prize: X=2670, Y=4152

Button A: X+99, Y+86
Button B: X+25, Y+99
Prize: X=8796, Y=10655

Button A: X+97, Y+28
Button B: X+44, Y+47
Prize: X=6790, Y=5287

Button A: X+71, Y+13
Button B: X+17, Y+67
Prize: X=15700, Y=18636

Button A: X+88, Y+35
Button B: X+45, Y+98
Prize: X=9930, Y=9877

Button A: X+31, Y+57
Button B: X+23, Y+13
Prize: X=14883, Y=17401

Button A: X+49, Y+11
Button B: X+31, Y+80
Prize: X=1819, Y=18339

Button A: X+99, Y+38
Button B: X+38, Y+57
Prize: X=3796, Y=3705

Button A: X+65, Y+30
Button B: X+20, Y+41
Prize: X=16400, Y=2050

Button A: X+19, Y+41
Button B: X+52, Y+25
Prize: X=2093, Y=11409

Button A: X+24, Y+84
Button B: X+65, Y+39
Prize: X=6125, Y=5415

Button A: X+39, Y+81
Button B: X+73, Y+25
Prize: X=7310, Y=2774

Button A: X+20, Y+48
Button B: X+48, Y+24
Prize: X=11964, Y=6992

Button A: X+61, Y+64
Button B: X+14, Y+89
Prize: X=5770, Y=12073

Button A: X+18, Y+86
Button B: X+62, Y+23
Prize: X=1850, Y=2828

Button A: X+49, Y+11
Button B: X+35, Y+81
Prize: X=9083, Y=2969

Button A: X+13, Y+82
Button B: X+98, Y+34
Prize: X=7886, Y=10020

Button A: X+28, Y+39
Button B: X+38, Y+14
Prize: X=14522, Y=15231

Button A: X+84, Y+12
Button B: X+12, Y+75
Prize: X=2616, Y=1473

Button A: X+15, Y+81
Button B: X+83, Y+38
Prize: X=2217, Y=2127

Button A: X+15, Y+40
Button B: X+60, Y+21
Prize: X=14105, Y=14346

Button A: X+19, Y+74
Button B: X+22, Y+11
Prize: X=3088, Y=5156

Button A: X+31, Y+23
Button B: X+30, Y+90
Prize: X=792, Y=1536

Button A: X+29, Y+11
Button B: X+20, Y+35
Prize: X=1254, Y=2076

Button A: X+15, Y+35
Button B: X+45, Y+26
Prize: X=14120, Y=14699

Button A: X+18, Y+61
Button B: X+53, Y+17
Prize: X=9368, Y=14132

Button A: X+58, Y+32
Button B: X+20, Y+50
Prize: X=12594, Y=11016

Button A: X+75, Y+11
Button B: X+11, Y+67
Prize: X=1837, Y=3029

Button A: X+15, Y+37
Button B: X+77, Y+53
Prize: X=4675, Y=4685

Button A: X+91, Y+22
Button B: X+57, Y+67
Prize: X=6699, Y=6090

Button A: X+18, Y+27
Button B: X+35, Y+11
Prize: X=13285, Y=13945

Button A: X+11, Y+41
Button B: X+84, Y+50
Prize: X=15364, Y=7098

Button A: X+17, Y+33
Button B: X+47, Y+24
Prize: X=12428, Y=19232

Button A: X+51, Y+36
Button B: X+29, Y+87
Prize: X=3586, Y=8652

Button A: X+13, Y+77
Button B: X+43, Y+32
Prize: X=2319, Y=5496

Button A: X+52, Y+12
Button B: X+38, Y+72
Prize: X=17922, Y=16052

Button A: X+37, Y+12
Button B: X+11, Y+42
Prize: X=9216, Y=740

Button A: X+26, Y+68
Button B: X+66, Y+20
Prize: X=13716, Y=3144

Button A: X+48, Y+23
Button B: X+35, Y+58
Prize: X=3530, Y=19394

Button A: X+32, Y+17
Button B: X+11, Y+26
Prize: X=7563, Y=12768

Button A: X+64, Y+18
Button B: X+11, Y+85
Prize: X=3383, Y=6603

Button A: X+42, Y+18
Button B: X+33, Y+50
Prize: X=18143, Y=12014

Button A: X+13, Y+24
Button B: X+46, Y+12
Prize: X=3203, Y=12860

Button A: X+82, Y+23
Button B: X+11, Y+68
Prize: X=8381, Y=13611

Button A: X+18, Y+14
Button B: X+21, Y+55
Prize: X=2466, Y=3542

Button A: X+22, Y+27
Button B: X+41, Y+12
Prize: X=3425, Y=2709

Button A: X+19, Y+46
Button B: X+59, Y+36
Prize: X=13707, Y=14528

Button A: X+79, Y+76
Button B: X+81, Y+15
Prize: X=8477, Y=2429

Button A: X+14, Y+52
Button B: X+51, Y+28
Prize: X=13435, Y=400

Button A: X+13, Y+90
Button B: X+88, Y+53
Prize: X=3386, Y=2861

Button A: X+16, Y+48
Button B: X+59, Y+39
Prize: X=2802, Y=5370

Button A: X+61, Y+39
Button B: X+12, Y+28
Prize: X=3251, Y=14769

Button A: X+61, Y+32
Button B: X+29, Y+55
Prize: X=15301, Y=11760

Button A: X+84, Y+67
Button B: X+22, Y+71
Prize: X=2100, Y=6165

Button A: X+74, Y+13
Button B: X+54, Y+58
Prize: X=3264, Y=2708

Button A: X+80, Y+86
Button B: X+18, Y+95
Prize: X=6060, Y=11810

Button A: X+11, Y+80
Button B: X+74, Y+65
Prize: X=4843, Y=4465

Button A: X+28, Y+49
Button B: X+72, Y+40
Prize: X=3720, Y=4876

Button A: X+79, Y+41
Button B: X+11, Y+53
Prize: X=17080, Y=3544

Button A: X+25, Y+11
Button B: X+26, Y+41
Prize: X=10950, Y=19270

Button A: X+26, Y+50
Button B: X+41, Y+14
Prize: X=6504, Y=18240

Button A: X+35, Y+64
Button B: X+82, Y+34
Prize: X=7914, Y=4964

Button A: X+32, Y+14
Button B: X+29, Y+47
Prize: X=3801, Y=9057

Button A: X+59, Y+17
Button B: X+36, Y+77
Prize: X=16929, Y=16549

Button A: X+65, Y+89
Button B: X+73, Y+16
Prize: X=5247, Y=6009

Button A: X+57, Y+22
Button B: X+12, Y+89
Prize: X=1371, Y=2554

Button A: X+55, Y+66
Button B: X+98, Y+23
Prize: X=9696, Y=4824

Button A: X+14, Y+41
Button B: X+63, Y+38
Prize: X=5849, Y=337

Button A: X+30, Y+73
Button B: X+49, Y+17
Prize: X=16159, Y=18772

Button A: X+23, Y+13
Button B: X+24, Y+42
Prize: X=14243, Y=18635

Button A: X+72, Y+29
Button B: X+15, Y+44
Prize: X=13301, Y=15812

Button A: X+32, Y+73
Button B: X+47, Y+13
Prize: X=2757, Y=6163

Button A: X+29, Y+12
Button B: X+19, Y+38
Prize: X=3796, Y=10482

Button A: X+14, Y+49
Button B: X+66, Y+25
Prize: X=1790, Y=2557

Button A: X+69, Y+12
Button B: X+29, Y+48
Prize: X=3831, Y=924

Button A: X+50, Y+17
Button B: X+47, Y+81
Prize: X=5819, Y=4055

Button A: X+32, Y+98
Button B: X+30, Y+21
Prize: X=5380, Y=10948

Button A: X+77, Y+16
Button B: X+48, Y+99
Prize: X=6611, Y=9208

Button A: X+43, Y+13
Button B: X+26, Y+51
Prize: X=8449, Y=10214

Button A: X+75, Y+49
Button B: X+16, Y+72
Prize: X=7949, Y=10671

Button A: X+66, Y+14
Button B: X+15, Y+54
Prize: X=7130, Y=13916

Button A: X+22, Y+45
Button B: X+61, Y+30
Prize: X=4625, Y=9320

Button A: X+15, Y+62
Button B: X+58, Y+12
Prize: X=19789, Y=3466

Button A: X+41, Y+78
Button B: X+53, Y+16
Prize: X=4759, Y=12566

Button A: X+37, Y+12
Button B: X+24, Y+35
Prize: X=6701, Y=5546

Button A: X+28, Y+34
Button B: X+53, Y+17
Prize: X=4761, Y=2703

Button A: X+42, Y+18
Button B: X+27, Y+48
Prize: X=10796, Y=19634

Button A: X+12, Y+81
Button B: X+66, Y+55
Prize: X=1200, Y=4195

Button A: X+12, Y+37
Button B: X+69, Y+43
Prize: X=1641, Y=3532

Button A: X+64, Y+20
Button B: X+23, Y+61
Prize: X=15134, Y=14666

Button A: X+58, Y+27
Button B: X+20, Y+59
Prize: X=4892, Y=13077

Button A: X+15, Y+64
Button B: X+77, Y+20
Prize: X=4642, Y=3644

Button A: X+13, Y+68
Button B: X+35, Y+39
Prize: X=1333, Y=5820

Button A: X+36, Y+94
Button B: X+90, Y+50
Prize: X=8874, Y=10406

Button A: X+18, Y+51
Button B: X+64, Y+38
Prize: X=10342, Y=5679

Button A: X+16, Y+28
Button B: X+35, Y+18
Prize: X=5441, Y=16670

Button A: X+23, Y+12
Button B: X+41, Y+83
Prize: X=1994, Y=2827

Button A: X+99, Y+37
Button B: X+24, Y+57
Prize: X=8934, Y=6557

Button A: X+31, Y+55
Button B: X+56, Y+28
Prize: X=6895, Y=3447

Button A: X+15, Y+39
Button B: X+60, Y+29
Prize: X=11720, Y=10724

Button A: X+82, Y+84
Button B: X+21, Y+93
Prize: X=5429, Y=10923

Button A: X+21, Y+56
Button B: X+66, Y+23
Prize: X=10691, Y=8258

Button A: X+53, Y+26
Button B: X+25, Y+64
Prize: X=5681, Y=6098

Button A: X+47, Y+78
Button B: X+40, Y+14
Prize: X=5920, Y=10370

Button A: X+51, Y+21
Button B: X+15, Y+31
Prize: X=13418, Y=16260

Button A: X+24, Y+44
Button B: X+52, Y+17
Prize: X=16408, Y=18128

Button A: X+81, Y+39
Button B: X+13, Y+54
Prize: X=791, Y=4736

Button A: X+26, Y+12
Button B: X+20, Y+43
Prize: X=17344, Y=15695

Button A: X+41, Y+79
Button B: X+84, Y+33
Prize: X=4560, Y=5565

Button A: X+15, Y+60
Button B: X+64, Y+18
Prize: X=10078, Y=16766

Button A: X+77, Y+34
Button B: X+11, Y+59
Prize: X=6468, Y=7404

Button A: X+42, Y+63
Button B: X+46, Y+21
Prize: X=7730, Y=7035

Button A: X+43, Y+17
Button B: X+20, Y+64
Prize: X=14097, Y=11143

Button A: X+43, Y+16
Button B: X+44, Y+77
Prize: X=11701, Y=5191

Button A: X+49, Y+21
Button B: X+12, Y+30
Prize: X=9249, Y=5921

Button A: X+76, Y+27
Button B: X+30, Y+83
Prize: X=4640, Y=3674

Button A: X+52, Y+75
Button B: X+37, Y+11
Prize: X=17813, Y=19208

Button A: X+52, Y+36
Button B: X+42, Y+97
Prize: X=7016, Y=9476

Button A: X+25, Y+67
Button B: X+82, Y+62
Prize: X=1745, Y=3099

Button A: X+14, Y+54
Button B: X+75, Y+11
Prize: X=6535, Y=19767

Button A: X+25, Y+75
Button B: X+68, Y+21
Prize: X=9616, Y=1277

Button A: X+70, Y+89
Button B: X+59, Y+19
Prize: X=10106, Y=8704

Button A: X+12, Y+46
Button B: X+65, Y+28
Prize: X=5529, Y=13980

Button A: X+26, Y+72
Button B: X+72, Y+26
Prize: X=12562, Y=10952

Button A: X+65, Y+39
Button B: X+21, Y+42
Prize: X=8898, Y=5612

Button A: X+29, Y+11
Button B: X+43, Y+64
Prize: X=13219, Y=16279

Button A: X+51, Y+12
Button B: X+31, Y+73
Prize: X=8323, Y=9697

Button A: X+17, Y+38
Button B: X+28, Y+14
Prize: X=3010, Y=4396

Button A: X+37, Y+26
Button B: X+18, Y+40
Prize: X=16840, Y=5928

Button A: X+55, Y+26
Button B: X+26, Y+60
Prize: X=5990, Y=13188

Button A: X+25, Y+50
Button B: X+48, Y+15
Prize: X=4924, Y=2720

Button A: X+14, Y+33
Button B: X+43, Y+29
Prize: X=8624, Y=18226

Button A: X+34, Y+11
Button B: X+33, Y+47
Prize: X=6099, Y=19526

Button A: X+16, Y+61
Button B: X+74, Y+44
Prize: X=6778, Y=4648

Button A: X+52, Y+11
Button B: X+52, Y+98
Prize: X=6552, Y=5649

Button A: X+63, Y+14
Button B: X+25, Y+50
Prize: X=6130, Y=5540

Button A: X+35, Y+91
Button B: X+81, Y+22
Prize: X=7127, Y=4951

Button A: X+30, Y+57
Button B: X+51, Y+30
Prize: X=11087, Y=7355

Button A: X+35, Y+18
Button B: X+38, Y+61
Prize: X=17792, Y=16111

Button A: X+30, Y+14
Button B: X+35, Y+85
Prize: X=2100, Y=3452

Button A: X+45, Y+11
Button B: X+23, Y+63
Prize: X=17967, Y=17271

Button A: X+12, Y+35
Button B: X+42, Y+26
Prize: X=13022, Y=9764
'.split("\n")
    end

    before do
      allow(task_input_fetcher_double).to receive(:call).and_return(example)
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 29436
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 98728723
    end
  end
end
