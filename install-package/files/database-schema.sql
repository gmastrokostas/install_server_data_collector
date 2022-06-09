CREATE TABLE serverdata_schema.command_line_options (
    hostname character varying(50),
    cmnd_options character varying(200)
);


ALTER TABLE serverdata_schema.command_line_options OWNER TO seeker;

--
-- Name: hpv_vm_inventory; Type: TABLE; Schema: serverdata_schema; Owner: seeker
--

CREATE TABLE serverdata_schema.hpv_vm_inventory (
    hostname VARCHAR(30),
    vmname VARCHAR(30),
    date_cpt varchar(10),
    time_cpt VARCHAR(10)
);


ALTER TABLE serverdata_schema.hpv_vm_inventory OWNER TO seeker;

--
-- Name: network_setup; Type: TABLE; Schema: serverdata_schema; Owner: seeker
--

CREATE TABLE serverdata_schema.network_setup (
    hostname VARCHAR(30),
    default_interface VARCHAR(10),
    default_route inet,
    interface_type VARCHAR(10),
    dns_entries VARCHAR(100),
    date_cpt VARCHAR(10),
    time_cpt VARCHAR(10)
);


ALTER TABLE serverdata_schema.network_setup OWNER TO seeker;

--
-- Name: rpm_packages; Type: TABLE; Schema: serverdata_schema; Owner: seeker
--

CREATE TABLE serverdata_schema.rpm_packages (
    hostname VARCHAR(30),
    date_cpt VARCHAR(10),
    time_cpt VARCHAR(10),
    rpm_name VARCHAR(100),
    rpm_version VARCHAR(20),
    rpm_release VARCHAR(50)
);


ALTER TABLE serverdata_schema.rpm_packages OWNER TO seeker;

--
-- Name: rpm_packages_pre; Type: TABLE; Schema: serverdata_schema; Owner: seeker
--

CREATE TABLE serverdata_schema.rpm_packages_pre (
    hostname VARCHAR(30),
    date_cpt VARCHAR(10),
    time_cpt VARCHAR(10),
    rpm_name VARCHAR,
    rpm_version VARCHAR,
    rpm_release VARCHAR
);


ALTER TABLE serverdata_schema.rpm_packages_pre OWNER TO seeker;

--
-- Name: servers; Type: TABLE; Schema: serverdata_schema; Owner: seeker
--

CREATE TABLE serverdata_schema.servers (
    hostname VARCHAR(30) NOT NULL,
    date_cpt VARCHAR(10),
    time_cpt VARCHAR(10),
    os VARCHAR(20),
    osrel VARCHAR(5),
    selinux_status character varying,
    selinux_mode character varying,
    selinux_type character varying,
    total_m BIGINT,
    cpubrand VARCHAR(100),
    cores INT,
    arch VARCHAR(10),
    server_brand VARCHAR(100),
    virt_role VARCHAR(10),
    virt_type VARCHAR(10),
    uptime INT
);


ALTER TABLE serverdata_schema.servers OWNER TO seeker;

--
-- Name: storage_capacity; Type: TABLE; Schema: serverdata_schema; Owner: seeker
--

CREATE TABLE serverdata_schema.storage_capacity (
    hostname character varying(50),
    mount character varying(50),
    fstype character varying(10),
    device character varying(50),
    block_available bigint,
    block_total bigint,
    block_used bigint,
    moption character varying(100),
    uuid character varying(100),
    swap_mount character varying(50),
    swap_total_mb integer,
    swap_free integer,
    date_cpt VARCHAR(10),
    time_cpt VARCHAR(10)
);


ALTER TABLE serverdata_schema.storage_capacity OWNER TO seeker;

--
-- Name: servers pk_servers_hostname; Type: CONSTRAINT; Schema: serverdata_schema; Owner: seeker
--

ALTER TABLE ONLY serverdata_schema.servers
    ADD CONSTRAINT pk_servers_hostname PRIMARY KEY (hostname);


--
-- Name: command_line_options command_line_options_fk; Type: FK CONSTRAINT; Schema: serverdata_schema; Owner: seeker
--

ALTER TABLE ONLY serverdata_schema.command_line_options
    ADD CONSTRAINT command_line_options_fk FOREIGN KEY (hostname) REFERENCES serverdata_schema.servers(hostname) MATCH FULL;


--
-- Name: hpv_vm_inventory hpv_vm_inventory_fk; Type: FK CONSTRAINT; Schema: serverdata_schema; Owner: seeker
--

ALTER TABLE ONLY serverdata_schema.hpv_vm_inventory
    ADD CONSTRAINT hpv_vm_inventory_fk FOREIGN KEY (hostname) REFERENCES serverdata_schema.servers(hostname) MATCH FULL;


--
-- Name: network_setup network_setup_fk; Type: FK CONSTRAINT; Schema: serverdata_schema; Owner: seeker
--

ALTER TABLE ONLY serverdata_schema.network_setup
    ADD CONSTRAINT network_setup_fk FOREIGN KEY (hostname) REFERENCES serverdata_schema.servers(hostname) MATCH FULL;


--
-- Name: rpm_packages rpm_packages_fk; Type: FK CONSTRAINT; Schema: serverdata_schema; Owner: seeker
--

ALTER TABLE ONLY serverdata_schema.rpm_packages
    ADD CONSTRAINT rpm_packages_fk FOREIGN KEY (hostname) REFERENCES serverdata_schema.servers(hostname) MATCH FULL;


--
-- Name: storage_capacity storage_capacity_fk; Type: FK CONSTRAINT; Schema: serverdata_schema; Owner: seeker
--

ALTER TABLE ONLY serverdata_schema.storage_capacity
    ADD CONSTRAINT storage_capacity_fk FOREIGN KEY (hostname) REFERENCES serverdata_schema.servers(hostname) MATCH FULL;

