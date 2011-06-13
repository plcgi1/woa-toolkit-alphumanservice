package Alproute::REST::RouteManager::Backend;
use common::sense;
use base 'WOA::REST::Generic::Backend';
use Data::Dumper;


sub list {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    
    # make return with values - for tests
    my $res = { status => 'ok' };

    return $self->_get_data();

}

sub _get_data {
    return [
        {
            name => "Ушба Северная по Северному гребню",
            id => "1",
            region_map => 'risunok078.jpg',
            images => [{ name => 'ussg4a.jpg' },{ name => 'u-massiv.jpg'},{ name => 'ushba-ledopad.jpg' },{ name => 'ushba-ledopad2.jpg' },{ name => 'ushba-severnaya-gora.jpg'},{ name => 'ushba-severnaya.jpg'}],
            description => "
 <p>Массив Ужбы находится несколько южнее Главного Кавказского Хребта в Верхней Сванетии.</p>\
 <p>К северо-западу от Ужбы расположен массив вершин Шхельды, на севере пик Щуровского и на востоке Чатын-Тау.<br/>\
 <p>С седловины вершин Северная и Южная Ужба на юг стекает Гульский ледник, на восток от Ужбы находится западная ветвь Чалаатского ледника, спускающегося с Ужбинского плато, на запад течет ледник Ужба.<p>\
 <p>Северная Ужба имеет один гребень - северный, спускающийся к Ужбинскому плато, по которому и совершается восхождение с плато.\
 Южный гребень соединяет Северную Ужбу с Южной и является седловиной между этими вершинами.\
 На восток и северо-запад склоны массива Ужбы обрываются крутой стеной.</p>\
 <p>Первое советское восхождение было совершено в 1936 году Кизель и Олейниковым с Ужбинского плато по северному гребню.</p>\
<p>От селения Мазери по дороге сначала левого, затем правого берега реки Долра. Выше впадения справа по ходу потока Ушба, перейти по мосту реку Долра и вверх по правому берегу потока Ушба, далее по правобережной морене и правой стороне Ушбинского ледника, пересекая впадающий в него слева по ходу Южно-Шхельдинский ледник, выйти на осыпные площадки под южными склонами Шхельды - Охотничьи площадки. От селения Мазери 4-6 часов. От площадок подиматься вдоль склонов Шхельды на Ушбинское плато.</p>\
<p>От альплагеря Шхельда вверх по тропе левого берега Шхельдинского ущелья, сначала по лесу, затем по травянистым склонам до Шхельдинского ледника. В 300 м выше языка ледника выйти на его поверхностную морену. По морене, придерживаясь правого берега ледника, идти около 500 м вверх по ущелью, затем выйти вправо на тропу. По тропе на травянистом склоне подъем вдоль ледника до поляны у скал с черными полосами - Ночевок Аристова. На поляне бивак. От альплагеря Шхельда 3,5-4 часа.</p>\
<p>От ночевок Аристова по левой береговой морене Шхельдинского ледника выйти до места впадения в него ледника Ахсу. Здесь свернуть влево и по срединной морене ледника выйти к Шхельдинским ночевкам. Площадки их находятся слева от ледника на скальном выступе массива под склоном Западного гребня пика Вуллея. Подъем на ночевки со Шхельдинского ледника слева по крутому снежному склону или справа по крутым осыпям. От альплагеря Шхельда 6-7 часов. На Шхельдинских ночевках бивак.</p>\
<p>Со Шхельдинских ночевок по леднику выход под левую сторону Ушбинского ледопада, ближе к склонам пика Щуровского. Путь подъема по ледопаду желательно просмотреть со Шхельдинского ледника заранее. По ледопаду сначала проходить левой стороной (со склонов пика Щуровского - камнепады!), затем выйти на его середину и по ней вверх. Далее по снежному склону подняться на Ушбинское плато и по нему вправо - на Ушбинский перевал.</p>\
 <p>Путь от базы Спартак до Ужбинского плато (смотри описание пик Щуровского).</p>\
 <p>С ужбинского плато путь на вершину проходит вначале на подушку Северной Ужбы. Подъем на неё совершается в кошках. Пройдя подушку начинается траверсирование очень крутого 100 метрового фирнового склона с переходом на нем подгорной трещины. Пройдя трещину подъем продолжается до скал Насоченко в направлении небольшой зазубрины. Прохождение этого участка проводится на кошках со страховкой через ледовые крючья или ледоруб. Имеется опасность лавин с нависающего выше большого снежного карниза.</p>\
 <p>Поднявшись до скал подъем идет по разрушенным скалам Настенко со страховкой на крючьях (на скалах имеется небольшой участок снега). Подниматься следует до верхней части скал, где можно устроить место для ночлега. Выше от скал путь проходит по фирновому и местами ледовому склону в 50-60 метрах от карниза до гребня.</p>\
<p>На этом участке подъем совершается на кошках со страховкой через ледоруб или на ледовых крючьях. Перед выходом на гребень склон очень крутой, здесь стоит вырубить несколько ступеней.</p>\
<p>Выше подъем до вершины проходит по гребню, гребень имеет на своем пути три перепада. На юго-восток с гребня нависают огромные снежные карнизы, склоны круто обрываются вплоть до Ужбинского плато.</p>\
 <p>Склоны в сторону Ужбинского ледника также очень круты. Подъем по гребню проходит все время по его северо-западной стороне. В местах обнаженного льда от снега возможна рубка ступеней. При подъеме внимательно наблюдать за сильно нависающим снежным карнизом, близко к краю его не подходить из-за опасности провалиться на карнизе. Вершина представляет собой снежный гребень с нависающим снежным карнизом.</p>\
<p>Тур находится в 810 метрах ниже южной стороны на каменных плитах на пути к перемычке между Северной и Южной Ужбой.</p>\
 <p>Подъем с Ужбинского плато до вершины занимает 10-11 часов, спуск 6-7 часов и совершается с плато в один день с расчетом выхода очень рано утром; в зависимости от снежно-ледового покрова время может меняться.</p>\
 <p>По другому варианту расчет времени может быть следующим - 1-я ночевка на Шхельдинском приюте, 2-я на скалах Настенко, 3-я при спуске с вершины на Ужбинское плато.</p>",
            parent_id =>  '',
            category  =>   '4A',
            type      =>  'сл',
            high      =>  '4695'
        },
        {
            name => "Ушба Северная по Восточному склону Южного гребня с лед. Гуль",
            id => "2",
            region_map => 'risunok078.jpg',
            images => [{ name => 'ushba-gul.jpg'}],
            description => "От селения Гуль подойти по тропе к ледника Гуль и по его левой стороне выйти на левобережную морену. На площадках в верхней части морены бивак- Гульские площадки. От селения Гуль 4-5 часов.<br/> \
<p>С Гульских площадок выйти на ледник, пересечь его Восточную ветвь и по снежным склонам правой по ходу стороны ледника, придерживаясь склонов вершины Гульба, пройти площадки на скальном острове-гребешке под висячим ледником и по снежным склонам правой стороны ледника подойти под левую по ходу сторону большого Среднего скального острова, расположенного с правой стороны широкого ледово-снежного склона, спускающегося с седловины Ушбы.</p>\
<p>По крутым скалам средней и выше средней трудности неявно выраженного внутреннего угла подъем на остров. Далее вверх по крутому ледово-снежному склону с выходами скал, пересекая ледовые желоба, подойти под основание Юго-восточного ребра вершины Ушба Северная. От исходного бивака 3-5 часов.</p>\
<p>Из-под Юго-восточного ребра траверсом вверх-влево выйти в мульду под нависающие скалы- приют Коккина. От Гульских площадок 4-6 часов. Отсюда двигаться по кромке льда и скал. От большой трещины проще выйти на среднюю часть ледника и по ней (лавины) 400-500 м вверх на седловину. От приюта Коккина 3-8 часов.</p>\
<p>Здесь свернуть вправо и по снежному гребню седловины (карнизы), пройдя Северный жандарм в лоб или обойдя его справа, выйти на скальные площадки основания Южного гребня вершины Ушба Северная, расположенные слева от подходящего снежного гребня седловины.</p>\
<p>С площадки 30-40 м вверх-влево на Южный гребень. По простым и средней трудности разрушенным заснеженным скалам 300-350-метрового Южного гребня взойти на вершину Ушба Северная. От седловины 2-4 часа. С седловины возможен подъем по снежному гребню, затем по снежно-ледовому склону с правой стороны Южного гребня.</p> ",
            parent_id =>  '',
            category  =>  '4A',
            type      => 'комб',
            high      => '4695'
        },
        {
            name => "УШБА Малая",
            id => "3",
            region_map => 'risunok078.jpg',
            images => [{ name => 'um2b.jpg'},{ name => 'u-massiv.jpg'}],
            description => "
<p>Вершина Малая Ушба расположена в главном Кавказском хребте на Ушбинском плато. К северо-востоку от Малой Ушбы находится вершина Чатын-Тау, на юго-западе Северная и Южная Ушба и на севере пик Щуровского.</p>
<p>Вершина Малая Ушба поднимается над Ушбинским плато на 150 метров. Единственный гребень, спускающийся с вершины, идет в направлении к перевалу Чалаат, в трех остальных направлениях склоны вершины обрываются крутыми стенами.</p>
<p>Первое советское восхождение было совершено в 1936 году группой в составе Сидоренко и Слободской по правому кулуару.</p>
<p>Восхождение на вершину совершается с Ушбинского плато. Подъем с плато на вершину и спуск обратно на плато занимает 3-4.5 часа. Подъем с плато проходит по кулуару, обращенному в сторону Северной Ушбы. Начало подъема проходит метров 50-60 по снежному кулуару. Выше путь подъема идет по кулуару по скалам средней трудности.</p>
<p>Проходить надо с большой осторожностью, так как скалы сильно разрушаются и сыпучие. Скальный кулуар выводит на скальный гребень, по которому и идет путь до самой вершины. Спуск совершается по пути подъема. Подъем и спуск надо совершать со страховкой.</p>
<h4>Описание маршрута</h4>
<p>С ночевок на Ушбинском плато, обойдя бергшрунд слева, войти в снежный кулуар, который огибая западные стены вершины, уходит на юг.</p>
<p>По левой стороне кулуара 40 метров вверх (крючьевая страховка) затем подъем влево на Южный скальный контрфорс, поднимающийся от кулуара вверх влево на Северо-восточный гребень Малой Ушбы.</p>
<p>По крутым скалам контрфорса 100-120 метров прямо вверх на Северо-восточный гребень. Здесь поворот вправо и по простым скалам гребня подъем 30-40 метров на вершину Малая Ужба.</p>
<p>От Ушбинского плато 5-6 часов. Спуск по пути подъема.</p>",
            parent_id =>  '',
            category  =>  '2Б',
            type      => '',
            high      => '4200'
        }
    ];
}


1;

__END__

=head1 Alproute::REST::RouteManager::Backend


=head2 SYNOPSIS

[TODO]

=head2 DESCRIPTION

[TODO]

=head2 EXAMPLES

[TODO]

=head2 EXPORT

[TODO]

=head2 SEE ALSO

[TODO]

=head2 AUTHOR

plcgi E<lt>plcgi1 at gmail dot com<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by plcgi1

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
