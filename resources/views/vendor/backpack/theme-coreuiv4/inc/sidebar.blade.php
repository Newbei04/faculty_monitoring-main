@if (backpack_auth()->check())
<div class="{{ backpack_theme_config('classes.sidebar') }}" id="sidebar">
    <div class="sidebar-brand d-none d-md-flex">
        <a class="navbar-brand text-decoration-none" href="{{ backpack_url('dashboard') }}" title="{{ backpack_theme_config('project_name') }}">
            <div class="d-flex align-items-center gap-2">
                <img src="/image/logo.png" alt="PSU logo" style="height:50px;">
                <div class="d-flex flex-column lh-sm">
                    <span class="text-uppercase" style="font-family: 'Anton', sans-serif; font-size: 1.6rem; letter-spacing: 2px;">PSU</span>
                    <span style="font-size: 0.55rem; font-weight: 600; letter-spacing: 1px;">PANGASINAN STATE UNIVERSITY</span>
                    <span class="text-white-50" style="font-size: 1rem; font-style: italic;">College of CHMBAC</span>
                </div>
            </div>
        </a>
    </div>
    <ul class="sidebar-nav" data-coreui="navigation" data-simplebar="init">
        <div class="simplebar-mask">
            <div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content">
                <div class="simplebar-content">
                    @include(backpack_view('inc.sidebar_content'))
                </div>
            </div>
        </div>
    </ul>
</div>
@endif

@push('before_scripts')
  <script type="text/javascript">
    // Save default sidebar class
    let sidebar = document.querySelector('.sidebar');

    // Recover sidebar state
    sidebar.classList.toggle('hide', sessionStorage.getItem('sidebar-collapsed') === '1');
  </script>
@endpush

@push('after_scripts')
  <script>
      // Store sidebar state
      document.querySelector('.header-toggler').addEventListener('click', function() {
        sessionStorage.setItem('sidebar-collapsed', Number(sidebar.classList.contains('hide')));
        crud?.table?.fixedHeader.adjust();
      });
  </script>
@endpush
