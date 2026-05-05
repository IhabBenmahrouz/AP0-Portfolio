/**
 * rgpd.js - Gestion du consentement RGPD / CNIL
 *
 * Conformément au RGPD (UE 2016/679) et aux recommandations de la CNIL :
 * - Les ressources tierces (Google Fonts, Google Maps) ne sont chargées
 *   qu'après consentement explicite de l'utilisateur.
 * - Le consentement est stocké 6 mois dans localStorage (durée CNIL).
 * - L'utilisateur peut accepter ou refuser en un clic.
 */
(function () {
    'use strict';

    var CONSENT_KEY      = 'portfolio_rgpd_consent';
    var CONSENT_DATE_KEY = 'portfolio_rgpd_consent_date';
    var CONSENT_DAYS     = 180; // 6 mois — durée recommandée par la CNIL

    /* ---- Lecture / écriture du consentement ---- */

    function getConsent() {
        var consent     = localStorage.getItem(CONSENT_KEY);
        var consentDate = localStorage.getItem(CONSENT_DATE_KEY);
        if (!consent || !consentDate) return null;

        // Expiration après 6 mois
        var age = (Date.now() - new Date(consentDate).getTime()) / 86400000;
        if (age > CONSENT_DAYS) {
            localStorage.removeItem(CONSENT_KEY);
            localStorage.removeItem(CONSENT_DATE_KEY);
            return null;
        }
        return consent; // 'accepted' ou 'refused'
    }

    function saveConsent(value) {
        localStorage.setItem(CONSENT_KEY, value);
        localStorage.setItem(CONSENT_DATE_KEY, new Date().toISOString());
    }

    /* ---- Chargement des ressources tierces ---- */

    function loadGoogleFonts() {
        if (document.querySelector('link[href*="fonts.googleapis.com"]')) return;
        var link = document.createElement('link');
        link.rel  = 'stylesheet';
        link.href = 'https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;700&display=swap';
        document.head.appendChild(link);
    }

    function activateGoogleMaps() {
        var placeholders = document.querySelectorAll('.map-consent-placeholder');
        placeholders.forEach(function (placeholder) {
            var src = placeholder.getAttribute('data-src');
            if (!src) return;
            var iframe = buildMapIframe(src);
            placeholder.parentNode.replaceChild(iframe, placeholder);
        });
    }

    function buildMapIframe(src) {
        var iframe = document.createElement('iframe');
        iframe.src              = src;
        iframe.width            = '100%';
        iframe.height           = '450';
        iframe.style.border     = '0';
        iframe.allowFullscreen  = true;
        iframe.loading          = 'lazy';
        iframe.referrerPolicy   = 'no-referrer-when-downgrade';
        return iframe;
    }

    function applyConsent(consent) {
        if (consent === 'accepted') {
            loadGoogleFonts();
            activateGoogleMaps();
        }
    }

    /* ---- Bandeau de consentement ---- */

    function createBanner() {
        var banner = document.createElement('div');
        banner.id = 'rgpd-banner';
        banner.setAttribute('role', 'dialog');
        banner.setAttribute('aria-modal', 'true');
        banner.setAttribute('aria-label', 'Consentement aux cookies et traceurs');

        banner.innerHTML =
            '<div class="rgpd-banner-content">' +
                '<div class="rgpd-banner-text">' +
                    '<strong>Cookies et protection de la vie priv\u00e9e</strong>' +
                    '<p>Ce site utilise des services tiers (Google Fonts, Google Maps) susceptibles de transmettre votre adresse IP \u00e0 des serveurs hors UE. ' +
                    'Conform\u00e9ment au <strong>RGPD</strong> et aux recommandations de la ' +
                    '<a href="https://www.cnil.fr" target="_blank" rel="noopener noreferrer">CNIL</a>, ' +
                    'votre consentement est requis avant tout chargement de ces ressources. ' +
                    '<a href="mentions-legales.html">Politique de confidentialit\u00e9</a></p>' +
                '</div>' +
                '<div class="rgpd-banner-buttons">' +
                    '<button id="rgpd-accept" class="rgpd-btn rgpd-btn-accept">Tout accepter</button>' +
                    '<button id="rgpd-refuse" class="rgpd-btn rgpd-btn-refuse">Tout refuser</button>' +
                '</div>' +
            '</div>';

        document.body.appendChild(banner);

        document.getElementById('rgpd-accept').addEventListener('click', function () {
            saveConsent('accepted');
            applyConsent('accepted');
            hideBanner();
        });

        document.getElementById('rgpd-refuse').addEventListener('click', function () {
            saveConsent('refused');
            hideBanner();
        });
    }

    function hideBanner() {
        var banner = document.getElementById('rgpd-banner');
        if (!banner) return;
        banner.classList.add('rgpd-banner-hidden');
        setTimeout(function () { banner.remove(); }, 450);
    }

    /* ---- Bouton "Afficher la carte" dans le placeholder ---- */

    function setupMapLoadButtons() {
        document.addEventListener('click', function (e) {
            if (e.target && e.target.classList.contains('map-load-btn')) {
                var placeholder = e.target.closest('.map-consent-placeholder');
                if (!placeholder) return;
                var src = placeholder.getAttribute('data-src');
                if (!src) return;
                // Consentement ponctuel pour Google Maps uniquement
                var iframe = buildMapIframe(src);
                placeholder.parentNode.replaceChild(iframe, placeholder);
            }
        });
    }

    /* ---- Initialisation ---- */

    document.addEventListener('DOMContentLoaded', function () {
        setupMapLoadButtons();
        var consent = getConsent();
        if (consent === null) {
            createBanner();
        } else {
            applyConsent(consent);
        }
    });

}());
