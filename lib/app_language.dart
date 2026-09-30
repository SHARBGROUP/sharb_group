enum AppLanguage {
  bangla,
  english,
  mixed,
}

class AppLanguageData {
  static const Map<AppLanguage, Map<String, String>> translations = {
    AppLanguage.bangla: {
      'dashboard': 'ড্যাশবোর্ড',
      'sales': 'বিক্রয়',
      'orders': 'অর্ডার',
      'products': 'পণ্য',
      'customers': 'গ্রাহক',
      'suppliers': 'সরবরাহকারী',
      'accounts': 'হিসাব',
      'reports': 'রিপোর্ট',
      'backup': 'ব্যাকআপ',
      'settings': 'সেটিংস',
      'delivery': 'ডেলিভারি',
      'more': 'আরও',

      'add_product': 'পণ্য যোগ করুন',
      'new_sale': 'নতুন বিক্রয়',
      'new_order': 'নতুন অর্ডার',
      'customer_due': 'গ্রাহকের বাকি',
      'today_sales': 'আজকের বিক্রয়',
      'today_profit': 'আজকের লাভ',
      'pending_orders': 'অপেক্ষমাণ অর্ডার',
      'quick_actions': 'দ্রুত কাজ',

      'business_overview': 'আজকের Business Overview',
      'business_status': 'ব্যবসার অবস্থা',
      'system_status': 'সিস্টেমের অবস্থা',
      'ready_offline_cloud': 'প্রস্তুত • Offline + Cloud Sync',
      'online': 'অনলাইন',

      'expense': 'খরচ',
      'save_product': 'পণ্য সংরক্ষণ করুন',
      'purchase_price': 'ক্রয় মূল্য',
      'sale_price': 'বিক্রয় মূল্য',
      'wholesale_price': 'পাইকারি মূল্য',
      'stock': 'স্টক',
      'minimum_stock': 'সর্বনিম্ন স্টক',

      'language': 'ভাষা',
      'choose_language': 'আপনার পছন্দের ভাষা নির্বাচন করুন',
      'full_app_bangla': 'পুরো App বাংলায়',
      'full_app_english': 'পুরো App English-এ',
      'bangla_english_together': 'বাংলা + English একসাথে',

      'bangla': 'বাংলা',
      'english': 'English',
      'mixed': 'বাংলা + English',

      'module_coming_next': 'Module পরে আসছে...',
    },

    AppLanguage.english: {
      'dashboard': 'Dashboard',
      'sales': 'Sales',
      'orders': 'Orders',
      'products': 'Products',
      'customers': 'Customers',
      'suppliers': 'Suppliers',
      'accounts': 'Accounts',
      'reports': 'Reports',
      'backup': 'Backup',
      'settings': 'Settings',
      'delivery': 'Delivery',
      'more': 'More',

      'add_product': 'Add Product',
      'new_sale': 'New Sale',
      'new_order': 'New Order',
      'customer_due': 'Customer Due',
      'today_sales': 'Today\'s Sales',
      'today_profit': 'Today\'s Profit',
      'pending_orders': 'Pending Orders',
      'quick_actions': 'Quick Actions',

      'business_overview': 'Today\'s Business Overview',
      'business_status': 'Business Status',
      'system_status': 'System Status',
      'ready_offline_cloud': 'Ready • Offline + Cloud Sync',
      'online': 'ONLINE',

      'expense': 'Expense',
      'save_product': 'Save Product',
      'purchase_price': 'Purchase Price',
      'sale_price': 'Sale Price',
      'wholesale_price': 'Wholesale Price',
      'stock': 'Stock',
      'minimum_stock': 'Minimum Stock',

      'language': 'Language',
      'choose_language': 'Choose your preferred language',
      'full_app_bangla': 'Full App in Bangla',
      'full_app_english': 'Full App in English',
      'bangla_english_together': 'Bangla + English together',

      'bangla': 'বাংলা',
      'english': 'English',
      'mixed': 'বাংলা + English',

      'module_coming_next': 'Module coming next...',
    },

    AppLanguage.mixed: {
      'dashboard': 'Dashboard / ড্যাশবোর্ড',
      'sales': 'Sales / বিক্রয়',
      'orders': 'Orders / অর্ডার',
      'products': 'Products / পণ্য',
      'customers': 'Customers / গ্রাহক',
      'suppliers': 'Suppliers / সরবরাহকারী',
      'accounts': 'Accounts / হিসাব',
      'reports': 'Reports / রিপোর্ট',
      'backup': 'Backup / ব্যাকআপ',
      'settings': 'Settings / সেটিংস',
      'delivery': 'Delivery / ডেলিভারি',
      'more': 'More / আরও',

      'add_product': 'Add Product / পণ্য যোগ',
      'new_sale': 'New Sale / নতুন বিক্রয়',
      'new_order': 'New Order / নতুন অর্ডার',
      'customer_due': 'Customer Due / গ্রাহকের বাকি',
      'today_sales': 'Today\'s Sales / আজকের বিক্রয়',
      'today_profit': 'Today\'s Profit / আজকের লাভ',
      'pending_orders': 'Pending Orders / অপেক্ষমাণ অর্ডার',
      'quick_actions': 'Quick Actions / দ্রুত কাজ',

      'business_overview': 'Today\'s Business Overview / আজকের Business Overview',
      'business_status': 'Business Status / ব্যবসার অবস্থা',
      'system_status': 'System Status / সিস্টেমের অবস্থা',
      'ready_offline_cloud': 'Ready • Offline + Cloud Sync / প্রস্তুত • Offline + Cloud Sync',
      'online': 'ONLINE / অনলাইন',

      'expense': 'Expense / খরচ',
      'save_product': 'Save Product / পণ্য সংরক্ষণ',
      'purchase_price': 'Purchase Price / ক্রয় মূল্য',
      'sale_price': 'Sale Price / বিক্রয় মূল্য',
      'wholesale_price': 'Wholesale Price / পাইকারি মূল্য',
      'stock': 'Stock / স্টক',
      'minimum_stock': 'Minimum Stock / সর্বনিম্ন স্টক',

      'language': 'Language / ভাষা',
      'choose_language': 'Choose your preferred language / আপনার পছন্দের ভাষা নির্বাচন করুন',
      'full_app_bangla': 'Full App বাংলায়',
      'full_app_english': 'Full App in English',
      'bangla_english_together': 'বাংলা + English একসাথে',

      'bangla': 'বাংলা',
      'english': 'English',
      'mixed': 'বাংলা + English',

      'module_coming_next': 'Module coming next / Module পরে আসছে...',
    },
  };

  static String text(
      AppLanguage language,
      String key,
      ) {
    return translations[language]?[key] ?? key;
  }
}