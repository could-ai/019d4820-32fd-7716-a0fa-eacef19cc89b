import 'package:flutter/material.dart';

class DevelopersScreen extends StatefulWidget {
  const DevelopersScreen({super.key});

  @override
  State<DevelopersScreen> createState() => _DevelopersScreenState();
}

class _DevelopersScreenState extends State<DevelopersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC), // Светлый фон как на макете
      body: Row(
        children: [
          // Левый сайдбар
          _buildSidebar(),
          // Основной контент
          Expanded(
            child: Column(
              children: [
                // Верхняя панель (Header)
                _buildTopBar(),
                // Рабочая область
                Expanded(
                  child: _buildMainContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 260,
      color: Colors.white,
      child: Column(
        children: [
          // Логотип
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Icon(Icons.hexagon_outlined, color: Colors.blue, size: 32),
                const SizedBox(width: 12),
                Text(
                  'G-Hunt',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Меню
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _buildMenuItem(Icons.business, 'Подразделения'),
                _buildMenuItem(Icons.description_outlined, 'Заявки', hasArrow: true),
                _buildMenuItem(Icons.people_outline, 'Заказчики'),
                _buildMenuItem(Icons.folder_outlined, 'Проекты', hasArrow: true),
                _buildMenuItem(Icons.work_outline, 'Вакансии'),
                _buildMenuItem(Icons.person_search_outlined, 'Кандидаты', hasArrow: true),
                
                // Раскрытое меню "Партнерка"
                Container(
                  color: Colors.blue.shade50,
                  child: Column(
                    children: [
                      _buildMenuItem(
                        Icons.handshake_outlined, 
                        'Партнерка', 
                        isExpanded: true,
                        isSelected: false,
                        iconColor: Colors.blue,
                        textColor: Colors.blue,
                      ),
                      _buildSubMenuItem('Лиды', Icons.person_add_alt_1_outlined),
                      _buildSubMenuItem('Контакты', Icons.contact_page_outlined),
                      _buildSubMenuItem('Партнеры', Icons.handshake),
                      _buildSubMenuItem('Переговоры', Icons.forum_outlined),
                      _buildSubMenuItem('Собеседования', Icons.event_available_outlined),
                      // Активный пункт
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A85F6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          dense: true,
                          leading: const Icon(Icons.people_alt, color: Colors.white, size: 20),
                          title: const Text(
                            'Разработчики',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      _buildSubMenuItem('Реестр маржи и оборота', Icons.account_balance_wallet_outlined),
                    ],
                  ),
                ),
                
                _buildMenuItem(Icons.analytics_outlined, 'Аналитика'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {
    bool hasArrow = false, 
    bool isExpanded = false,
    bool isSelected = false,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.grey.shade700, size: 22),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.grey.shade800,
          fontWeight: isSelected || isExpanded ? FontWeight.w600 : FontWeight.normal,
          fontSize: 14,
        ),
      ),
      trailing: hasArrow || isExpanded
          ? Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
              color: Colors.grey.shade500,
              size: 20,
            )
          : null,
      onTap: () {},
    );
  }

  Widget _buildSubMenuItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: Colors.grey.shade600, size: 18),
        title: Text(
          title,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 64,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.grey),
            onPressed: () {},
          ),
          const Spacer(),
          // Профиль пользователя
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue.shade50,
                child: const Icon(Icons.person_outline, color: Colors.blue, size: 20),
              ),
              const SizedBox(width: 8),
              const Text(
                'Верди Марк',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(width: 20),
          // Уведомления
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications_none, color: Colors.grey, size: 24),
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          // Выход
          const Icon(Icons.exit_to_app, color: Colors.grey, size: 24),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок
          const Text(
            'Разработчики',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A)),
          ),
          const SizedBox(height: 8),
          Text(
            'Разработчики от партнеров на проектах',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          
          // Белая карточка с контентом
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  // Панель поиска и фильтров
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Поиск по разработчикам',
                                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                                prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt_outlined, size: 18, color: Colors.white),
                            label: const Text('Фильтры', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A85F6),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 3),
                      ],
                    ),
                  ),
                  
                  // Таблица данных
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(Colors.grey.shade50),
                          dataRowMaxHeight: 80,
                          dataRowMinHeight: 60,
                          columnSpacing: 24,
                          horizontalMargin: 16,
                          columns: const [
                            DataColumn(label: Text('Партнер', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Дата\nвыхода', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('ФИО', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Дата\nснятия', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Проект', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Должность', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Координатор', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Ставка', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Аккаунт-\nменеджер', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Юр.лицо\nГлобус', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('НДС\nвключен?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('Ставка\nНДС', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Text('ИНН', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                            DataColumn(label: Row(
                              children: [
                                Text('Дата\nсоздания', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                Icon(Icons.arrow_drop_down, size: 16),
                              ],
                            )),
                          ],
                          rows: [
                            _buildDataRow(
                              partner: 'SoftJet',
                              dateIn: '—',
                              name: 'Прасолов\nМихаил\nАлександрович',
                              dateOut: '—',
                              project: '—',
                              role: 'Системный\nаналитик',
                              coordinator: 'Морозова\nИнга\nАлександровна',
                              rate: '2600.00',
                              manager: '—',
                              company: 'ООО\n"ГЛОБУС-ИТ"',
                              vatIncluded: false,
                              vatRate: '—',
                              inn: '6234204924',
                              created: '15.12.2025',
                            ),
                            _buildDataRow(
                              partner: 'Wlx\nteam',
                              dateIn: '08.12.2025',
                              name: 'Колтович\nАлександр\nВладимирович',
                              dateOut: '16.03.2026',
                              project: '—',
                              role: 'Angular\nразработчик',
                              coordinator: 'Морозова\nИнга\nАлександровна',
                              rate: '2900.00',
                              manager: '—',
                              company: 'ООО\n"ГЛОБУС-ИТ"',
                              vatIncluded: true,
                              vatRate: '5%',
                              inn: '262516635114',
                              created: '10.12.2025',
                            ),
                            _buildDataRow(
                              partner: 'Ethixon',
                              dateIn: '28.11.2025',
                              name: 'Терещенко\nГеоргий\nДмитриевич',
                              dateOut: '—',
                              project: '—',
                              role: 'QA-инженер',
                              coordinator: 'Куделина\nЕсения\nСергеевна',
                              rate: '2200.00',
                              manager: '—',
                              company: 'ООО\n"ГЛОБУС-ИТ"',
                              vatIncluded: true,
                              vatRate: '5%',
                              inn: '—',
                              created: '28.11.2025',
                            ),
                            _buildDataRow(
                              partner: 'FrameWork\nTeam',
                              dateIn: '27.11.2025',
                              name: 'Латышев\nАртем\nСергеевич',
                              dateOut: '—',
                              project: '—',
                              role: 'ReactJS\nразработчик',
                              coordinator: 'Морозова\nИнга\nАлександровна',
                              rate: '2200.00',
                              manager: '—',
                              company: 'ООО\n"ГЛОБУС-ИТ"',
                              vatIncluded: false,
                              vatRate: '5%',
                              inn: '7321011247',
                              created: '26.11.2025',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Пагинация (Footer)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey.shade200)),
                    ),
                    child: Row(
                      children: [
                        const Text('Показать:', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        const SizedBox(width: 8),
                        Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: '20',
                              icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                              style: const TextStyle(fontSize: 13, color: Colors.black87),
                              items: <String>['10', '20', '50'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('элементов', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        const SizedBox(width: 16),
                        Text('Показано 1-20 из 746', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                        const Spacer(),
                        // Кнопки пагинации
                        Row(
                          children: [
                            _buildPaginationButton(Icons.keyboard_double_arrow_left, isDisabled: true),
                            const SizedBox(width: 4),
                            _buildPaginationButton(Icons.keyboard_arrow_left, isDisabled: true),
                            const SizedBox(width: 12),
                            const Text('Страница 1 из 38', style: TextStyle(fontSize: 13)),
                            const SizedBox(width: 12),
                            _buildPaginationButton(Icons.keyboard_arrow_right, isBlue: true),
                            const SizedBox(width: 4),
                            _buildPaginationButton(Icons.keyboard_double_arrow_right, isBlue: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow({
    required String partner,
    required String dateIn,
    required String name,
    required String dateOut,
    required String project,
    required String role,
    required String coordinator,
    required String rate,
    required String manager,
    required String company,
    required bool vatIncluded,
    required String vatRate,
    required String inn,
    required String created,
  }) {
    return DataRow(
      cells: [
        DataCell(Text(partner, style: const TextStyle(fontSize: 12))),
        DataCell(Text(dateIn, style: const TextStyle(fontSize: 12))),
        DataCell(Text(name, style: const TextStyle(fontSize: 12, height: 1.3))),
        DataCell(Text(dateOut, style: const TextStyle(fontSize: 12))),
        DataCell(Text(project, style: const TextStyle(fontSize: 12))),
        DataCell(Text(role, style: const TextStyle(fontSize: 12, height: 1.3))),
        DataCell(Text(coordinator, style: const TextStyle(fontSize: 12, height: 1.3))),
        DataCell(Text(rate, style: const TextStyle(fontSize: 12))),
        DataCell(Text(manager, style: const TextStyle(fontSize: 12))),
        DataCell(Text(company, style: const TextStyle(fontSize: 12, height: 1.3))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: vatIncluded ? const Color(0xFF4A85F6) : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              vatIncluded ? 'ДА' : 'НЕТ',
              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataCell(Text(vatRate, style: const TextStyle(fontSize: 12))),
        DataCell(Text(inn, style: const TextStyle(fontSize: 12))),
        DataCell(Text(created, style: const TextStyle(fontSize: 12))),
      ],
    );
  }

  Widget _buildPaginationButton(IconData icon, {bool isDisabled = false, bool isBlue = false}) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isDisabled 
            ? Colors.blue.shade100.withOpacity(0.5) 
            : (isBlue ? const Color(0xFF4A85F6) : Colors.white),
        borderRadius: BorderRadius.circular(4),
        border: isDisabled || isBlue ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(
        icon, 
        size: 18, 
        color: isDisabled ? Colors.white : (isBlue ? Colors.white : Colors.grey.shade700),
      ),
    );
  }
}
