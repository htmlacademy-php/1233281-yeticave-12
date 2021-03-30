<main class="container">
    <section class="promo">
        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
            <!--заполните этот список из массива категорий-->
            <li class="promo__item promo__item--boards">
                <a class="promo__link" href="pages/all-lots.html">Имя категории</a>
            </li>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <?php foreach ($products as $product) : ?>
                <li class="lots__item lot">
                    <div class="lot__image">
                        <img src="<?= htmlspecialchars($product['img']) ?>" width="350" height="260" alt="<?= htmlspecialchars($product['name']) ?>">
                    </div>
                    <div class="lot__info">
                        <span class="lot__category"><?= htmlspecialchars($product['category']) ?></span>
                        <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?= htmlspecialchars($product['name']) ?></a></h3>
                        <div class="lot__state">
                            <div class="lot__rate">
                                <span class="lot__amount">Стартовая цена</span>
                                <span class="lot__cost"><?= getFormattedPrice(htmlspecialchars($product['price'])) ?></span>
                            </div>
                            <?php $dateDif = getDateDif(htmlspecialchars($product['expirationDate']));
                            $hoursDif = $dateDif[0];
                            $minutesDif = $dateDif[1];

                            $timerValue = "{$hoursDif}:{$minutesDif}";

                            $timerFinishingClass = '';

                            if ($hoursDif === 0) {
                                $timerFinishingClass = 'timer--finishing';
                            }

                            ?>
                            <div class="lot__timer timer <?= $timerFinishingClass ?>">
                                <?= $timerValue ?>
                            </div>

                        </div>
                    </div>
                </li>
            <?php endforeach; ?>
        </ul>
    </section>
</main>