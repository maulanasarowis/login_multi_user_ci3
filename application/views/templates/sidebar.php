<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin<sup>2</sup></div>
    </a>

     <!-- Divider -->
     <hr class="sidebar-divider">

    <!-- Query Menu -->
    <?php
    $role_id   = $this->session->userdata('role_id');
    $queryMenu = "SELECT users_menu.id, menu
                    FROM users_menu JOIN users_access_menu
                      ON users_menu.id = users_access_menu.id_menu
                   WHERE users_access_menu.role_id = $role_id
                ORDER BY users_access_menu.id_menu ASC
                ";
    $menu      = $this->db->query($queryMenu)->result_array();
    ?>

    <!-- Looping Menu -->
    <?php foreach ($menu as $m) : ?>
         
        <div class="sidebar-heading">
            <?= $m['menu'];?>
        </div>

        <!-- Sub-Menu sesuai Menu -->
        <?php
        $menuId   = $m['id'];
        $querySubMenu = "SELECT *
                        FROM users_sub_menu
                        WHERE id_menu = $menuId
                        AND is_active = 1
                    ";
        $subMenu      = $this->db->query($querySubMenu)->result_array();
        ?>

        <?php foreach ($subMenu as $sm) : ?>
            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="<?= base_url($sm['url'])?>" <?= $sm['html_data_toggle']?>>
                    <i class="<?= $sm['icon'] ?>"></i>
                    <span><?= $sm['title']?></span>
                </a>

                <!-- Sub-Sub-Menu sesuai Menu -->
                <?php
                $subMenuId   = $sm['id'];
                $querySubMenu = "SELECT *
                                FROM users_sub_sub_menu
                                WHERE id_sub_menu = $subMenuId
                                AND is_active = 1
                            ";
                $subSubMenu      = $this->db->query($querySubMenu)->result_array();
                ?>

                <div <?= $sm['html_id']?> class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    <?php foreach ($subSubMenu as $ssm) : ?>
                            <a class="collapse-item" href="<?= base_url('admin/departemen'); ?>"><?= $ssm['title']?></a>
                    <?php endforeach; ?>
                    </div>
                </div>

            </li>

        <?php endforeach; ?>
         <!-- Divider -->
         <hr class="sidebar-divider">

    <?php endforeach; ?>

    <!-- Divider -->
    <!-- <hr class="sidebar-divider"> -->

    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('C_auth/logout'); ?>">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Logout</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->