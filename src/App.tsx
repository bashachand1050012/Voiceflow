import { useState } from 'react';
import { Button } from 'primereact/button';
import { InputText } from 'primereact/inputtext';
import {
  IconActivity,
  IconBell,
  IconChevronDown,
  IconCircleHelp,
  IconCommand,
  IconLayoutDashboard,
  IconMessages,
  IconPhone,
  IconSearch,
  IconSettings,
  IconShieldCheck,
  IconSparkles,
  IconTemplate,
  IconUsers,
  IconChartBar,
  IconCalendarEvent,
  IconBuilding,
  IconMenu2,
} from '@tabler/icons-react';

type NavItem = {
  label: string;
  icon: typeof IconLayoutDashboard;
  children?: string[];
};

const navigation: NavItem[] = [
  { label: 'Overview', icon: IconLayoutDashboard, children: ['Dashboard', 'Analytics', 'Team activity', 'Reports'] },
  { label: 'Customers', icon: IconUsers },
  { label: 'Engagement', icon: IconMessages },
  { label: 'Calls', icon: IconPhone },
  { label: 'Templates', icon: IconTemplate },
  { label: 'AI & Automations', icon: IconSparkles },
  { label: 'Configuration', icon: IconSettings },
  { label: 'Administration', icon: IconShieldCheck },
];

function App() {
  const [activeItem, setActiveItem] = useState('Dashboard');
  const [overviewOpen, setOverviewOpen] = useState(true);
  const [companyMenuOpen, setCompanyMenuOpen] = useState(false);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);
  const [search, setSearch] = useState('');

  return (
    <div className={`crm-shell ${sidebarCollapsed ? 'sidebar-collapsed' : ''}`}>
      <aside className="sidebar">
        <div className="company-switcher-wrap">
          <button className="company-switcher" onClick={() => setCompanyMenuOpen(!companyMenuOpen)} aria-expanded={companyMenuOpen}>
            <span className="company-logo" aria-hidden="true"><span /></span>
            <span className="company-meta">
              <strong>Northstar CX</strong>
              <small>Growth plan</small>
            </span>
            <IconChevronDown className="company-chevron" size={16} />
          </button>
          {companyMenuOpen && (
            <div className="company-menu">
              <div className="company-menu-label">Your workspaces</div>
              <button className="company-option active"><span className="company-option-mark">N</span><span><strong>Northstar CX</strong><small>Current workspace</small></span></button>
              <button className="company-option"><span className="company-option-mark alt">A</span><span><strong>Acme Support</strong><small>Demo workspace</small></span></button>
              <button className="add-workspace"><span>＋</span> Add workspace</button>
            </div>
          )}
        </div>

        <div className="sidebar-search">
          <IconSearch size={16} />
          <InputText value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Search a page" aria-label="Search a page" />
          <kbd>/</kbd>
        </div>

        <nav className="primary-nav" aria-label="Primary navigation">
          {navigation.map((item) => {
            const ItemIcon = item.icon;
            const isOverview = item.label === 'Overview';
            const isActive = item.children ? item.children.includes(activeItem) : activeItem === item.label;
            return (
              <div className="nav-group" key={item.label}>
                <button
                  className={`nav-link ${isActive ? 'active' : ''}`}
                  onClick={() => {
                    if (item.children) setOverviewOpen(!overviewOpen);
                    else setActiveItem(item.label);
                  }}
                >
                  <ItemIcon size={19} stroke={1.7} />
                  <span>{item.label}</span>
                  {item.children && <IconChevronDown className={`nav-chevron ${overviewOpen ? 'expanded' : ''}`} size={14} />}
                </button>
                {item.children && overviewOpen && (
                  <div className="subnav">
                    {item.children.map((child) => (
                      <button key={child} className={`subnav-link ${activeItem === child ? 'selected' : ''}`} onClick={() => setActiveItem(child)}>
                        {child}
                      </button>
                    ))}
                  </div>
                )}
              </div>
            );
          })}
        </nav>

        <div className="sidebar-bottom">
          <div className="usage-block">
            <div className="usage-heading"><span>Workspace usage</span><span className="usage-period">This month</span></div>
            <div className="usage-line"><span>AI minutes</span><strong>68%</strong></div>
            <div className="usage-track"><span style={{ width: '68%' }} /></div>
            <div className="usage-line"><span>Storage</span><strong>34%</strong></div>
            <div className="usage-track"><span className="storage-fill" style={{ width: '34%' }} /></div>
          </div>
          <button className="support-link"><IconCircleHelp size={16} /> <span>Help & support</span></button>
          <div className="profile-row">
            <span className="profile-avatar">BC</span>
            <span className="profile-meta"><strong>Basha Chandra</strong><small>Workspace admin</small></span>
            <IconChevronDown size={15} />
          </div>
        </div>
      </aside>

      <main className="main-panel">
        <header className="topbar">
          <div className="topbar-left">
            <Button className="mobile-menu" text rounded icon={<IconMenu2 size={19} />} aria-label="Toggle navigation" onClick={() => setSidebarCollapsed(!sidebarCollapsed)} />
            <button className="workspace-select"><IconBuilding size={16} /><span>Sales workspace</span><IconChevronDown size={14} /></button>
            <span className="topbar-divider" />
            <div className="breadcrumbs"><span>Workspace</span><span className="crumb-slash">/</span><strong>{activeItem}</strong></div>
          </div>
          <div className="topbar-actions">
            <button className="topbar-icon ai-action" aria-label="AI assistant"><IconSparkles size={18} /></button>
            <button className="topbar-icon" aria-label="Call"><IconPhone size={18} /></button>
            <button className="topbar-icon" aria-label="Activity"><IconActivity size={18} /></button>
            <button className="topbar-icon notification-button" aria-label="Notifications"><IconBell size={18} /><i /></button>
            <button className="topbar-icon" aria-label="Help"><IconCircleHelp size={18} /></button>
            <span className="topbar-divider" />
            <button className="topbar-avatar" aria-label="Open profile menu">BC</button>
          </div>
        </header>

        <section className="page-content">
          <div className="page-heading">
            <div>
              <div className="eyebrow">NORTHSTAR CX <span>·</span> SALES WORKSPACE</div>
              <h1>{activeItem}</h1>
              <p>Your customer conversations and intelligence, in one place.</p>
            </div>
            <div className="page-heading-actions">
              <Button label="Today" outlined size="small" className="date-button" />
              <Button label="Last 7 days" outlined size="small" className="date-button" />
              <Button label="Last 30 days" outlined size="small" className="date-button" />
            </div>
          </div>
          <div className="workspace-canvas">
            <div className="canvas-topline">
              <div className="canvas-icon"><IconChartBar size={21} /></div>
              <div><strong>Your CRM workspace is ready</strong><span>The navigation shell is set up. Your customer intelligence views will live here.</span></div>
            </div>
            <div className="canvas-guides">
              <div className="guide-item"><IconUsers size={18} /><span>Customer profiles</span></div>
              <div className="guide-item"><IconMessages size={18} /><span>Conversation history</span></div>
              <div className="guide-item"><IconCalendarEvent size={18} /><span>Follow-up activity</span></div>
              <div className="guide-item"><IconCommand size={18} /><span>AI call insights</span></div>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}

export default App;
